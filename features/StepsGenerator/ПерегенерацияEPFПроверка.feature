﻿# language: ru

@IgnoreOnLinux
@OneThread
@IgnoreOnWeb

Функционал: Проверка перегенерации EPF
	Как Разработчик
	Я Хочу чтобы чтобы при перегенерации epf уже существующие процедуры и функции сохранялись
 

	Сценарий: Перегенерация EPF c проверкой на уже существовавшие функции и процедуры

	Когда я открыл форму VanessaBehavoir в режиме самотестирования
	И я загрузил специальную тестовую фичу "ФичаДляПроверкиПерегенерацииEPFПроверка"
	И Пауза 1
	И я перешел на закладку генератор EPF
	И ожидаемый проверочный файл epf уже существует
	И я нажал на кнопку "СоздатьШаблоныОбработок"
	И Пауза 10
	Тогда я получил сгенерированный epf файл в ожидаемом каталоге
#	Сществует специальная тестовая функция	
	И сгенерированный проверочный epf прошел проверку на корректность после перегенерации

