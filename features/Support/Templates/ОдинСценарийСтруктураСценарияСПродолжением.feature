﻿# language: ru

@IgnoreOnCIMainBuild


Функционал: Загрузить фичу в vanessa-behavior
	Как Разработчик
	Я Хочу чтобы чтобы у меня была возможность выполнить один сценарий структуры сценария
 
 

Структура сценария: Загрузка тестовой фичи проверка с выбранного шага часть
	Когда это шаг служебного экспортного сценария
	Когда Я увеличил значение <ИмяПараметра> в КонтекстСохраняемый на 1
	И     Я увеличил значение <ИмяПараметра> в КонтекстСохраняемый на 1
	И     Я увеличил значение <ИмяПараметра> в КонтекстСохраняемый на 1
	И     Я могу продолжить выполнение шагов в хост системе если СлужебныйПараметр больше 4

	Примеры:
		| ИмяПараметра      |
		| СлужебныйПараметр |
		| СлужебныйПараметр |
		
Сценарий: Тестовый сценарий		
	И     Я увеличил значение "СлужебныйПараметр" в КонтекстСохраняемый на 1