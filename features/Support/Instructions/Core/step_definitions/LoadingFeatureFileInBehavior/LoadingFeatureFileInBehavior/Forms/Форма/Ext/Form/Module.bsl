﻿//начало текста модуля

///////////////////////////////////////////////////
//Служебная часть
///////////////////////////////////////////////////

&НаКлиенте
// контекст фреймворка Vanessa-Behavior
Перем Ванесса;
 
&НаКлиенте
// Структура, в которой хранится состояние сценария между выполнением шагов. Очищается перед выполнением каждого сценария.
Перем Контекст Экспорт;
 
&НаКлиенте
// Структура, в которой можно хранить служебные данные между запусками сценариев. Существует, пока открыта форма Vanessa-Behavior.
Перем КонтекстСохраняемый Экспорт;

&НаКлиенте
// Служебная функция.
Функция ДобавитьШагВМассивТестов(МассивТестов,Снипет,ИмяПроцедуры,ПредставлениеТеста = Неопределено,Транзакция = Неопределено,Параметр = Неопределено)
	Структура = Новый Структура;
	Структура.Вставить("Снипет",Снипет);
	Структура.Вставить("ИмяПроцедуры",ИмяПроцедуры);
	Структура.Вставить("ИмяПроцедуры",ИмяПроцедуры);
	Структура.Вставить("ПредставлениеТеста",ПредставлениеТеста);
	Структура.Вставить("Транзакция",Транзакция);
	Структура.Вставить("Параметр",Параметр);
	МассивТестов.Добавить(Структура);
КонецФункции

&НаКлиенте
// Функция экспортирует список шагов, которые реализованы в данной внешней обработке.
Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;

	//описание параметров
	//ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,Транзакция,Параметр);

	ДобавитьШагВМассивТестов(ВсеТесты,"ЯВыполняюДействияДляЗагрузкиFeature_файла()","ЯВыполняюДействияДляЗагрузкиFeature_файла","Когда Я выполняю действия для загрузки feature-файла");

	Возврат ВсеТесты;
КонецФункции
	
&НаСервере
// Служебная функция.
Функция ПолучитьМакетСервер(ИмяМакета)
	ОбъектСервер = РеквизитФормыВЗначение("Объект");
	Возврат ОбъектСервер.ПолучитьМакет(ИмяМакета);
КонецФункции
	
&НаКлиенте
// Служебная функция для подключения библиотеки создания fixtures.
Функция ПолучитьМакетОбработки(ИмяМакета) Экспорт
	Возврат ПолучитьМакетСервер(ИмяМакета);
КонецФункции



///////////////////////////////////////////////////
//Работа со сценариями
///////////////////////////////////////////////////

&НаКлиенте
// Процедура выполняется перед началом каждого сценария
Процедура ПередНачаломСценария() Экспорт
	
КонецПроцедуры

&НаКлиенте
// Процедура выполняется перед окончанием каждого сценария
Процедура ПередОкончаниемСценария() Экспорт
	
КонецПроцедуры



///////////////////////////////////////////////////
//Реализация шагов
///////////////////////////////////////////////////

&НаКлиенте
//Когда Я выполняю действия для загрузки feature-файла
//@ЯВыполняюДействияДляЗагрузкиFeature_файла()
Процедура ЯВыполняюДействияДляЗагрузкиFeature_файла() Экспорт
	Команда = ПолучитьСтрокуВызоваSikuli() + Ванесса.Объект.КаталогИнструментов + "\tools\Sikuli\LoadingFeatureFileInBehavior.sikuli """ + Ванесса.Объект.КаталогИнструментов + "features\Support\Instructions\Core\Demo.feature""";
	
	Результат = Ванесса.ВыполнитьКомандуОСБезПоказаЧерногоОкна(Команда);
	
	Ванесса.ПроверитьРавенство(Результат, 0 , "");
КонецПроцедуры

&НаКлиенте
Функция ПолучитьСтрокуВызоваSikuli()
	Возврат """C:\Program Files (x86)\Java\jre6\bin\java.exe"" -Xms64M -Xmx512M -Dfile.encoding=UTF-8 -Dpython.path=""C:\Program Files (x86)\Sikuli Xi\sikuli-script.jar/"" -jar ""C:\Program Files (x86)\Sikuli X\sikuli-ide.jar"" -r ";
КонецФункции	

//окончание текста модуля