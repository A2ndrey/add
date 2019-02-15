﻿Перем КонтекстЯдра;
Перем Ожидаем, ИтераторМетаданных;

Перем НаборТестов;
Перем ПривилегированныеРоли;

Процедура Инициализация(КонтекстЯдраПараметр) Экспорт
	
	КонтекстЯдра = КонтекстЯдраПараметр;
	Ожидаем = КонтекстЯдра.Плагин("УтвержденияBDD");
	
	ЗагрузитьНастройки();
	
	Если Не ЗначениеЗаполнено(ПривилегированныеРоли) Тогда 
		Возврат;  // ВНИМАНИЕ! Ранний возврат.
	КонецЕсли;
	
	ИтераторМетаданных = КонтекстЯдра.Плагин("ИтераторМетаданных");
	ИтераторМетаданных.Инициализация(КонтекстЯдраПараметр); 	// Сброс реквизитов плагина. Необходимо сделать, т.к. плагин уже мог быть инициализирован другой тестовой обработкой	
	ИтераторМетаданных.ДополнятьЗависимымиОбъектами = Истина;   // В принципе, можно и не дополнять. Проверял работу этого флага.
	
	ИтераторМетаданных.ДопустимыеМетаданные.Добавить(Метаданные.Документы);
	ИтераторМетаданных.ДопустимыеМетаданные.Добавить(Метаданные.Справочники);
	ИтераторМетаданных.ДопустимыеМетаданные.Добавить(Метаданные.РегистрыСведений);
	ИтераторМетаданных.ДопустимыеМетаданные.Добавить(Метаданные.Константы);
	ИтераторМетаданных.ДопустимыеМетаданные.Добавить(Метаданные.РегистрыНакопления);
	ИтераторМетаданных.ДопустимыеМетаданные.Добавить(Метаданные.ПланыВидовХарактеристик);
	ИтераторМетаданных.ДопустимыеМетаданные.Добавить(Метаданные.Задачи);
	ИтераторМетаданных.ДопустимыеМетаданные.Добавить(Метаданные.БизнесПроцессы);
	
	// При ДополнятьЗависимымиОбъектами = Истина, в объектах проверки появляются и перечисления. 
	// Но настройки прав для перечислений - нет. Поэтому Перечисления исключаем.
	ИтераторМетаданных.ИсключаемыеМетаданные.Добавить(Метаданные.Перечисления); 
		
КонецПроцедуры

Процедура ЗаполнитьНаборТестов(НаборТестовПараметр, КонтекстЯдраПараметр) Экспорт
	
	НаборТестов = НаборТестовПараметр; 	// Запищем в переменную модуля, чтобы другие методы могли дополнять набор тестов
	Инициализация(КонтекстЯдраПараметр);// Все инициализируем. В т.ч. и ИтераторМетаданных
	
	НаборТестов.Добавить("Тест_РолиОпределены"); // Проверим, что есть роли с полными полномочиями чтения
	
	// Заполним дерево тестов
	Если ЗначениеЗаполнено(ПривилегированныеРоли) Тогда 
		ИтераторМетаданных.Перечислить(ЭтотОбъект, "ПриСледующемОбъектеМетаданных", "ПриСледующемОбъектеМетаданных");
	КонецЕсли;
	
КонецПроцедуры

Процедура ДобавитьРоль(РолиСоответствие, ИмяРоли)
	
	Попытка
		РолиСоответствие.Вставить(Метаданные.Роли[ИмяРоли], Истина)
	Исключение
	КонецПопытки;
	
КонецПроцедуры

Процедура Тест_РолиОпределены() Экспорт
	Ожидаем.Что(ПривилегированныеРоли, "Есть проверяемые роли").Заполнено();	
КонецПроцедуры

Процедура ПриСледующемОбъектеМетаданных(ОбъектМетаданных, Родитель) Экспорт
	
	ПолноеИмяОбъекта = ОбъектМетаданных.ПолноеИмя();
	
	ЗаголовокОбщаяЧасть = "Проверка доступа на Чтение Не-Администраторами";
	Если Родитель=Неопределено И ТипЗнч(ОбъектМетаданных)=Тип("Строка") Тогда 
		НаборТестов.НачатьГруппу(ЗаголовокОбщаяЧасть + " " + ОбъектМетаданных);
		
	ИначеЕсли ОбъектМетаданных<>Неопределено Тогда 
		ПараметрыТеста = НаборТестов.ПараметрыТеста(ПолноеИмяОбъекта, Родитель);
		ЗаголовокТеста = "" + ОбъектМетаданных.ПолноеИмя() + ": " + ЗаголовокОбщаяЧасть;
		НаборТестов.Добавить("Тест_ПроверитьНеАдминистраторскиеПраваНаЧтение", ПараметрыТеста, ЗаголовокТеста);
		
	КонецЕсли;
	
КонецПроцедуры

Процедура Тест_ПроверитьНеАдминистраторскиеПраваНаЧтение(ПолноеИмяМетаданного, Родитель) Экспорт
	ОбъектМетаданных = Метаданные.НайтиПоПолномуИмени(ПолноеИмяМетаданного);
	
	ЧтениеДоступно = Ложь;
	Для Каждого ТекРоль Из Метаданные.Роли Цикл 
		
		Если ПривилегированныеРоли.Получить(ТекРоль)<>Неопределено Тогда 
			Продолжить;
		КонецЕсли;
		
		ПараметрыДоступаОбъекта = ПараметрыДоступа("Read", ОбъектМетаданных, , ТекРоль);
		Если ПараметрыДоступаОбъекта.Доступность Тогда 
			ЧтениеДоступно = Истина;
			Прервать;
		КонецЕсли;
		
	КонецЦикла;
	
	Ожидаем.Что(ЧтениеДоступно, ПолноеИмяМетаданного + " недоступно для чтения ролями без привилегий").ЕстьИстина();
	
КонецПроцедуры

#Область РаботаСНастройками

Процедура ЗагрузитьНастройки()

	ПутьНастройки = "ПроверкаЧтенияНеАдминистраторами";
	ПлагинНастроек = КонтекстЯдра.Плагин("Настройки");
	ПлагинНастроек.Инициализация(КонтекстЯдра);
	МассивПривилегированныеРоли = ПлагинНастроек.ПолучитьНастройку(ПутьНастройки);
	
	ПривилегированныеРоли = Новый Соответствие;
	Если ЗначениеЗаполнено(МассивПривилегированныеРоли) Тогда
		Для Каждого ИмяРоли Из МассивПривилегированныеРоли Цикл
			ДобавитьРоль(ПривилегированныеРоли, ИмяРоли);
		КонецЦикла;
	Иначе
		ЗаполнитьПривилегированныеРолиПоУмолчанию();
	КонецЕсли;

КонецПроцедуры

Процедура ЗаполнитьПривилегированныеРолиПоУмолчанию()
	// Заполняем специализированные роли - это не администраторские роли и не общие роли на Чтение
	ДобавитьРоль(ПривилегированныеРоли, "Администратор");
	ДобавитьРоль(ПривилегированныеРоли, "ПолныеПрава");
	ДобавитьРоль(ПривилегированныеРоли, "АдминНСИ");
	ДобавитьРоль(ПривилегированныеРоли, "Тестирование");
	ДобавитьРоль(ПривилегированныеРоли, "РазработкаКонфигурации");
	ДобавитьРоль(ПривилегированныеРоли, "Обмен");
	ДобавитьРоль(ПривилегированныеРоли, "Пользователь"); // общая роль на Чтение
КонецПроцедуры

#КонецОбласти
