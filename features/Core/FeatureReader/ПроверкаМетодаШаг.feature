﻿# language: ru

@IgnoreOnWeb



Функционал: Cлужебная фича для проверки метода шаг
	Как Разработчик
	Я Хочу чтобы если я вызываю метод шаг
	Чтобы снипеты фичи, которая вызывается в методе шаг корректно подгрузила контекст обработки
 

Сценарий: Вызов в методе Шаг вложенной структуры сценария
	Когда Я вызываю вложенную структуру сценария для проверки метода шаг
	Тогда В КонтекстСохраняемый есть значение "Значение1" равное "Значение1"
	

Сценарий: Вызов в методе Шаг вложенного сценария
	Когда я вызываю вложенный сценарий для проверки метода шаг
	Когда Это вложенный сценарий для проверки метода шаг
	

 
 
Сценарий: Рабочий сценарий для проверки метода шаг

	Когда в своём методе я вызову служебный шаг для проверки загрузки снипетов метода шаг
	

