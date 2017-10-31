﻿# language: ru

@IgnoreOnCIMainBuild
@DocumentationBuild
@tree

Функционал: инструкция по загрузки фич во фреймворк Vanessa-Behavior
	Как Разработчик
	Я Хочу чтобы я мог загрузить нужные мне фичи во фреймворк Vanessa-Behavior
	Чтобы я мог их потом запустить на выполнение
 
Контекст:
	Дано Я открываю Vanessa-Behavior в TestClient без загрузки сохраненных настроек

	
	
	
Сценарий: Загрузка одной фичи из каталога
	Когда Я нажимаю на кнопку Загрузить одну фичу
	Тогда в открывшемся окне я указываю путь к фиче "Core\FeatureWrite\Док-ПримерНаписанияФичи.feature"
	Тогда произошла загрузка одной фичи из каталога
	
	
	

Сценарий: Загрузка нескольких фич из каталога
	Когда Я нажимаю на кнопку Загрузить файлы из каталога
	И     в открывшемся окне я указываю путь к каталогу фич "Core\FeatureWrite"
	Тогда произошла загрузка фич из каталога
	И я делаю свёртку строк дерева до фич
	И В Дереве есть несколько фич

	
	
	

Сценарий: Загрузка фич с использованием тэгов исключений
	Когда Я нажимаю на кнопку Загрузить файлы из каталога
	И     в открывшемся окне я указываю путь к каталогу фич "Core\OpenForm"
	И я делаю свёртку строк дерева до фич
	И В Дереве есть несколько фич
	И Затем я добавляю фильтр, чтобы исключить фичи содержащие тег @IgnoreOnCIMainBuild
			И     я перехожу к закладке "Сервис"
			И     я нажимаю кнопку выбора у поля "Список исключаемых тэгов"
			Тогда открылось окно "Список значений"
			И     я нажимаю на кнопку "Добавить"
			И     в ТЧ "ValueList" в поле "Значение" я ввожу текст "IgnoreOnCIMainBuild"
			И     В форме "Список значений" в ТЧ "ValueList" я завершаю редактирование строки
			И     я нажимаю на кнопку "ОК"
			
	И     Я нажимаю на кнопку Перезагрузить Сценарии
	И я делаю свёртку строк дерева до фич
	Тогда одна из фич не загрузилась, т.к. в ней был указан тег @IgnoreOnCIMainBuild	
	И количество фич в дереве уменьшилось
	



	
Сценарий: Загрузка фич с использованием тэгов фильтров
	Когда Я нажимаю на кнопку Загрузить файлы из каталога
	И     в открывшемся окне я указываю путь к каталогу фич "Core\OpenForm"
	И я делаю свёртку строк дерева до фич
	И В Дереве есть несколько фич
	И Затем я добавляю фильтр, чтобы загрузить только фичи содержащие @IgnoreOnCIMainBuild
			И     я перехожу к закладке "Сервис"
			И     я нажимаю кнопку выбора у поля "Тэги для запуска"
			Тогда открылось окно "Список значений"
			И     я нажимаю на кнопку "Добавить"
			И     в ТЧ "ValueList" в поле "Значение" я ввожу текст "IgnoreOnCIMainBuild"
			И     В форме "Список значений" в ТЧ "ValueList" я завершаю редактирование строки
			И     я нажимаю на кнопку "ОК"
			
	И     Я нажимаю на кнопку Перезагрузить Сценарии
	И я делаю свёртку строк дерева до фич
	Тогда одна из фич не загрузилась, т.к. в ней НЕ был указан тег @IgnoreOnCIMainBuild	
	И количество фич в дереве уменьшилось
	И обратите внимание 'Спасибо за внимание!'

	