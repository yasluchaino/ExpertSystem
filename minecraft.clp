
(deftemplate ioproxy ; шаблон факта-посредника для обмена информацией с GUI
	(slot message (default none))
)

(deffacts proxy-fact ; экземпляр факта ioproxy
	(ioproxy
		(message none)
	)
)

(defrule clear-message
	(declare (salience 90))
	?clear-msg-flg <- (clearmessage)
	?sendmessage <- (sendmessagehalt ?msg)
	=>
	(retract ?clear-msg-flg)
	(retract ?sendmessage)
)

(defrule set-output-and-halt
	(declare (salience 99))
	?current-message <- (sendmessagehalt ?new-msg)
	?proxy <- (ioproxy (message ?msg))
	=>
	(modify ?proxy (message ?new-msg))
	(retract ?current-message)
	(halt)
)

;================================================

(deftemplate fact ; Шаблон факта
	(slot name (default none))  ; Название
)

(defrule Rule_1
	(declare (salience 40))
	(fact (name дерево))
	=>
	(assert (fact (name доски_)))
	(assert(sendmessagehalt " дерево = доски|доски |"))
	(halt)
)

(defrule Rule_2
	(declare (salience 40))
	(fact (name доски_))
	=>
	(assert (fact (name палка)))
	(assert(sendmessagehalt " доски = палка|палка|"))
	(halt)
)

(defrule Rule_3
	(declare (salience 40))
	(fact (name доски_))
	=>
	(assert (fact (name верстак)))
	(assert(sendmessagehalt " доски = верстак|верстак|"))
	(halt)
)

(defrule Rule_4
	(declare (salience 40))
	(fact (name доски_))
	=>
	(assert (fact (name сундук)))
	(assert(sendmessagehalt " доски = сундук|сундук|"))
	(halt)
)

(defrule Rule_5
	(declare (salience 40))
	(fact (name сундук))
	(fact (name железный_слиток))
	=>
	(assert (fact (name загрузочная_воронка________)))
	(assert(sendmessagehalt " сундук + железный слиток = загрузочная воронка |загрузочная воронка        |"))
	(halt)
)

(defrule Rule_6
	(declare (salience 40))
	(fact (name факел))
	(fact (name железные_кусочки))
	=>
	(assert (fact (name фонарь)))
	(assert(sendmessagehalt " факел + железные кусочки = фонарь|фонарь|"))
	(halt)
)

(defrule Rule_7
	(declare (salience 40))
	(fact (name железный_слиток))
	=>
	(assert (fact (name железные_кусочки)))
	(assert(sendmessagehalt " железный слиток = железные кусочки|железные кусочки|"))
	(halt)
)

(defrule Rule_8
	(declare (salience 40))
	(fact (name железные_кусочки))
	=>
	(assert (fact (name железный_слиток)))
	(assert(sendmessagehalt " железные кусочки = железный слиток|железный слиток|"))
	(halt)
)

(defrule Rule_9
	(declare (salience 40))
	(fact (name железные_кусочки))
	(fact (name железный_слиток))
	=>
	(assert (fact (name цепь)))
	(assert(sendmessagehalt " железные кусочки + железный слиток = цепь|цепь|"))
	(halt)
)

(defrule Rule_10
	(declare (salience 40))
	(fact (name доски_))
	(fact (name палка))
	=>
	(assert (fact (name топор)))
	(assert(sendmessagehalt " доски  + палка = топор|топор|"))
	(halt)
)

(defrule Rule_11
	(declare (salience 40))
	(fact (name алмаз))
	=>
	(assert (fact (name алмазный_блок)))
	(assert(sendmessagehalt " алмаз = алмазный блок|алмазный блок|"))
	(halt)
)

(defrule Rule_12
	(declare (salience 40))
	(fact (name железный_слиток))
	=>
	(assert (fact (name железный_блок)))
	(assert(sendmessagehalt " железный слиток = железный блок|железный блок|"))
	(halt)
)

(defrule Rule_13
	(declare (salience 40))
	(fact (name железный_слиток))
	(fact (name палка))
	=>
	(assert (fact (name топор)))
	(assert(sendmessagehalt " железный слиток + палка = топор|топор|"))
	(halt)
)

(defrule Rule_14
	(declare (salience 40))
	(fact (name золотой_слиток))
	(fact (name палка))
	=>
	(assert (fact (name топор)))
	(assert(sendmessagehalt " золотой слиток + палка = топор|топор|"))
	(halt)
)

(defrule Rule_15
	(declare (salience 40))
	(fact (name алмаз))
	(fact (name палка))
	=>
	(assert (fact (name топор)))
	(assert(sendmessagehalt " алмаз + палка = топор|топор|"))
	(halt)
)

(defrule Rule_16
	(declare (salience 40))
	(fact (name доски_))
	(fact (name палка))
	=>
	(assert (fact (name меч)))
	(assert(sendmessagehalt " доски  + палка = меч|меч|"))
	(halt)
)

(defrule Rule_17
	(declare (salience 40))
	(fact (name железный_слиток))
	(fact (name палка))
	=>
	(assert (fact (name меч)))
	(assert(sendmessagehalt " железный слиток + палка = меч|меч|"))
	(halt)
)

(defrule Rule_18
	(declare (salience 40))
	(fact (name золотой_слиток))
	(fact (name палка))
	=>
	(assert (fact (name меч)))
	(assert(sendmessagehalt " золотой слиток + палка = меч|меч|"))
	(halt)
)

(defrule Rule_19
	(declare (salience 40))
	(fact (name алмаз))
	(fact (name доски_))
	=>
	(assert (fact (name меч)))
	(assert(sendmessagehalt " алмаз + доски  = меч|меч|"))
	(halt)
)

(defrule Rule_20
	(declare (salience 40))
	(fact (name доски_))
	(fact (name железный_слиток))
	=>
	(assert (fact (name щит)))
	(assert(sendmessagehalt " доски  + железный слиток = щит|щит|"))
	(halt)
)

(defrule Rule_21
	(declare (salience 40))
	(fact (name железный_слиток))
	=>
	(assert (fact (name шлем)))
	(assert(sendmessagehalt " железный слиток = шлем|шлем|"))
	(halt)
)

(defrule Rule_22
	(declare (salience 40))
	(fact (name бумага))
	(fact (name кожа))
	=>
	(assert (fact (name книга)))
	(assert(sendmessagehalt " бумага + кожа = книга|книга|"))
	(halt)
)

(defrule Rule_23
	(declare (salience 40))
	(fact (name железный_слиток))
	=>
	(assert (fact (name вагонетка_)))
	(assert(sendmessagehalt " железный слиток = вагонетка |вагонетка |"))
	(halt)
)

(defrule Rule_24
	(declare (salience 40))
	(fact (name сахарный_тростник))
	=>
	(assert (fact (name бумага)))
	(assert(sendmessagehalt " сахарный тростник = бумага|бумага|"))
	(halt)
)

(defrule Rule_25
	(declare (salience 40))
	(fact (name уголь))
	(fact (name палка))
	=>
	(assert (fact (name факел)))
	(assert(sendmessagehalt " уголь + палка = факел|факел|"))
	(halt)
)

(defrule Rule_26
	(declare (salience 40))
	(fact (name алмазный_блок))
	=>
	(assert (fact (name алмаз)))
	(assert(sendmessagehalt " алмазный блок = алмаз|алмаз|"))
	(halt)
)

(defrule Rule_27
	(declare (salience 40))
	(fact (name булыжник))
	(fact (name доски_))
	(fact (name железный_слиток))
	(fact (name красная_пыль))
	=>
	(assert (fact (name поршень)))
	(assert(sendmessagehalt " булыжник + доски + железный слиток + красная пыль = поршень|поршень|"))
	(halt)
)

(defrule Rule_28
	(declare (salience 40))
	(fact (name доски_))
	=>
	(assert (fact (name лодка)))
	(assert(sendmessagehalt " доски  = лодка|лодка|"))
	(halt)
)

(defrule Rule_29
	(declare (salience 40))
	(fact (name шерсть))
	(fact (name доски_))
	=>
	(assert (fact (name кровать)))
	(assert(sendmessagehalt " шерсть + доски  = кровать|кровать|"))
	(halt)
)

(defrule Rule_30
	(declare (salience 40))
	(fact (name камень))
	=>
	(assert (fact (name каменная_плита)))
	(assert(sendmessagehalt " камень = каменная плита|каменная плита|"))
	(halt)
)

(defrule Rule_31
	(declare (salience 40))
	(fact (name железный_слиток))
	=>
	(assert (fact (name нагрудник)))
	(assert(sendmessagehalt " железный слиток = нагрудник|нагрудник|"))
	(halt)
)

(defrule Rule_32
	(declare (salience 40))
	(fact (name золотой_слиток))
	=>
	(assert (fact (name нагрудник)))
	(assert(sendmessagehalt " золотой слиток = нагрудник|нагрудник|"))
	(halt)
)

(defrule Rule_33
	(declare (salience 40))
	(fact (name алмаз))
	=>
	(assert (fact (name нагрудник)))
	(assert(sendmessagehalt " алмаз = нагрудник|нагрудник|"))
	(halt)
)

(defrule Rule_34
	(declare (salience 40))
	(fact (name кожа))
	=>
	(assert (fact (name нагрудник)))
	(assert(sendmessagehalt " кожа = нагрудник|нагрудник|"))
	(halt)
)

(defrule Rule_35
	(declare (salience 40))
	(fact (name золотой_слиток))
	=>
	(assert (fact (name шлем)))
	(assert(sendmessagehalt " золотой слиток = шлем|шлем|"))
	(halt)
)

(defrule Rule_36
	(declare (salience 40))
	(fact (name алмаз))
	=>
	(assert (fact (name шлем)))
	(assert(sendmessagehalt " алмаз = шлем|шлем|"))
	(halt)
)

(defrule Rule_37
	(declare (salience 40))
	(fact (name кожа))
	=>
	(assert (fact (name шлем)))
	(assert(sendmessagehalt " кожа = шлем|шлем|"))
	(halt)
)

(defrule Rule_38
	(declare (salience 40))
	(fact (name железный_слиток))
	=>
	(assert (fact (name штаны)))
	(assert(sendmessagehalt " железный слиток = штаны|штаны|"))
	(halt)
)

(defrule Rule_39
	(declare (salience 40))
	(fact (name золотой_слиток))
	=>
	(assert (fact (name штаны)))
	(assert(sendmessagehalt " золотой слиток = штаны|штаны|"))
	(halt)
)

(defrule Rule_40
	(declare (salience 40))
	(fact (name алмаз))
	=>
	(assert (fact (name штаны)))
	(assert(sendmessagehalt " алмаз = штаны|штаны|"))
	(halt)
)

(defrule Rule_41
	(declare (salience 40))
	(fact (name кожа))
	=>
	(assert (fact (name штаны)))
	(assert(sendmessagehalt " кожа = штаны|штаны|"))
	(halt)
)

(defrule Rule_42
	(declare (salience 40))
	(fact (name железный_слиток))
	=>
	(assert (fact (name ботинки)))
	(assert(sendmessagehalt " железный слиток = ботинки|ботинки|"))
	(halt)
)

(defrule Rule_43
	(declare (salience 40))
	(fact (name золотой_слиток))
	=>
	(assert (fact (name ботинки)))
	(assert(sendmessagehalt " железный слиток = ботинки|ботинки|"))
	(halt)
)

(defrule Rule_44
	(declare (salience 40))
	(fact (name алмаз))
	=>
	(assert (fact (name ботинки)))
	(assert(sendmessagehalt " алмаз = ботинки|ботинки|"))
	(halt)
)

(defrule Rule_45
	(declare (salience 40))
	(fact (name кожа))
	=>
	(assert (fact (name ботинки)))
	(assert(sendmessagehalt " кожа = ботинки|ботинки|"))
	(halt)
)

(defrule Rule_46
	(declare (salience 40))
	(fact (name алмаз))
	=>
	(assert (fact (name алмазный_блок)))
	(assert(sendmessagehalt " алмаз = алмазный блок|алмазный блок|"))
	(halt)
)

(defrule Rule_47
	(declare (salience 40))
	(fact (name доски_))
	(fact (name книга))
	=>
	(assert (fact (name книжная_полка)))
	(assert(sendmessagehalt " доски  + книга = книжная полка|книжная полка|"))
	(halt)
)

(defrule Rule_48
	(declare (salience 40))
	(fact (name перо_))
	(fact (name кремний))
	(fact (name палка))
	=>
	(assert (fact (name стрела)))
	(assert(sendmessagehalt " перо  + кремний + палка = стрела|стрела|"))
	(halt)
)

(defrule Rule_49
	(declare (salience 40))
	(fact (name кирпич))
	=>
	(assert (fact (name цветочный_горшок)))
	(assert(sendmessagehalt " кирпич = цветочный горшок|цветочный горшок|"))
	(halt)
)

(defrule Rule_50
	(declare (salience 40))
	(fact (name мак))
	=>
	(assert (fact (name красный_краситель)))
	(assert(sendmessagehalt " мак = красный краситель|красный краситель|"))
	(halt)
)

(defrule Rule_51
	(declare (salience 40))
	(fact (name одуванчик))
	=>
	(assert (fact (name жёлтый_краситель)))
	(assert(sendmessagehalt " одуванчик = жёлтый краситель|жёлтый краситель|"))
	(halt)
)

(defrule Rule_52
	(declare (salience 40))
	(fact (name подсолнечник))
	=>
	(assert (fact (name жёлтый_краситель)))
	(assert(sendmessagehalt " подсолнечник = жёлтый краситель|жёлтый краситель|"))
	(halt)
)

(defrule Rule_53
	(declare (salience 40))
	(fact (name чернильный_мешок))
	=>
	(assert (fact (name чёрный_краситель)))
	(assert(sendmessagehalt " чернильный мешок = чёрный краситель|чёрный краситель|"))
	(halt)
)

(defrule Rule_54
	(declare (salience 40))
	(fact (name оранжевый_тюльпан_))
	=>
	(assert (fact (name оранжевый_краситель)))
	(assert(sendmessagehalt " оранжевый тюльпан  = оранжевый краситель|оранжевый краситель|"))
	(halt)
)

(defrule Rule_55
	(declare (salience 40))
	(fact (name красный_краситель))
	(fact (name жёлтый_краситель))
	=>
	(assert (fact (name оранжевый_краситель)))
	(assert(sendmessagehalt " красный краситель + жёлтый краситель = оранжевый краситель|оранжевый краситель|"))
	(halt)
)

(defrule Rule_56
	(declare (salience 40))
	(fact (name красный_краситель))
	(fact (name синий_краситель_))
	=>
	(assert (fact (name фиолетовый_краситель)))
	(assert(sendmessagehalt " красный краситель + синий краситель  = фиолетовый краситель|фиолетовый краситель|"))
	(halt)
)

(defrule Rule_57
	(declare (salience 40))
	(fact (name песок))
	(fact (name порох))
	=>
	(assert (fact (name динамит)))
	(assert(sendmessagehalt " песок + порох = динамит|динамит|"))
	(halt)
)

(defrule Rule_58
	(declare (salience 40))
	(fact (name пион))
	=>
	(assert (fact (name розовый_краситель)))
	(assert(sendmessagehalt " пион = розовый краситель|розовый краситель|"))
	(halt)
)

(defrule Rule_59
	(declare (salience 40))
	(fact (name песок))
	=>
	(assert (fact (name стекло)))
	(assert(sendmessagehalt " песок = стекло|стекло|"))
	(halt)
)

(defrule Rule_60
	(declare (salience 40))
	(fact (name белый_краситель))
	(fact (name красный_краситель))
	=>
	(assert (fact (name розовый_краситель)))
	(assert(sendmessagehalt " белый краситель + красный краситель = розовый красител|розовый краситель|"))
	(halt)
)

(defrule Rule_61
	(declare (salience 40))
	(fact (name обсидиан))
	(fact (name око_края))
	=>
	(assert (fact (name сундук_края)))
	(assert(sendmessagehalt " обсидиан + око края = сундук края|сундук края|"))
	(halt)
)

(defrule Rule_62
	(declare (salience 40))
	(fact (name обсидиан))
	(fact (name книга))
	(fact (name алмаз))
	=>
	(assert (fact (name зачаровательный_стол)))
	(assert(sendmessagehalt " обсидиан + книга + алмаз = зачаровательный стол|зачаровательный стол|"))
	(halt)
)

(defrule Rule_63
	(declare (salience 40))
	(fact (name доски_))
	=>
	(assert (fact (name лестница_)))
	(assert(sendmessagehalt " доски  = лестница |лестница |"))
	(halt)
)

(defrule Rule_64
	(declare (salience 40))
	(fact (name кирпич))
	=>
	(assert (fact (name лестница_)))
	(assert(sendmessagehalt " кирпич = лестница |лестница |"))
	(halt)
)

(defrule Rule_65
	(declare (salience 40))
	(fact (name булыжник))
	=>
	(assert (fact (name лестница_)))
	(assert(sendmessagehalt " булыжник = лестница |лестница |"))
	(halt)
)

(defrule Rule_66
	(declare (salience 40))
	(fact (name кирпич))
	=>
	(assert (fact (name кирпичный_блок)))
	(assert(sendmessagehalt " кирпич = кирпичный блок|кирпичный блок|"))
	(halt)
)

(defrule Rule_67
	(declare (salience 40))
	(fact (name доски_))
	(fact (name алмаз))
	=>
	(assert (fact (name музыкальная_шкатулка)))
	(assert(sendmessagehalt " доски + алмаз = музыкальная шкатулка|музыкальная шкатулка|"))
	(halt)
)

(defrule Rule_68
	(declare (salience 40))
	(fact (name булыжник))
	=>
	(assert (fact (name печь)))
	(assert(sendmessagehalt " булыжник = печь|печь|"))
	(halt)
)

(defrule Rule_69
	(declare (salience 40))
	(fact (name железный_слиток))
	(fact (name палка))
	=>
	(assert (fact (name лопата)))
	(assert(sendmessagehalt " железный слиток + палка = лопата|лопата|"))
	(halt)
)

(defrule Rule_70
	(declare (salience 40))
	(fact (name доски_))
	(fact (name палка))
	=>
	(assert (fact (name лопата)))
	(assert(sendmessagehalt " доски + палка = лопата|лопата|"))
	(halt)
)

(defrule Rule_71
	(declare (salience 40))
	(fact (name золотой_слиток))
	(fact (name палка))
	=>
	(assert (fact (name лопата)))
	(assert(sendmessagehalt " золотой слиток + палка = лопата|лопата|"))
	(halt)
)

(defrule Rule_72
	(declare (salience 40))
	(fact (name алмаз))
	(fact (name палка))
	=>
	(assert (fact (name лопата)))
	(assert(sendmessagehalt " алмаз + палка = лопата|лопата|"))
	(halt)
)

(defrule Rule_73
	(declare (salience 40))
	(fact (name стекло))
	=>
	(assert (fact (name колба)))
	(assert(sendmessagehalt " стекло = колба|колба|"))
	(halt)
)

(defrule Rule_74
	(declare (salience 40))
	(fact (name красная_пыль))
	(fact (name палка))
	=>
	(assert (fact (name красный_факел)))
	(assert(sendmessagehalt " красная пыль + палка = красный факел|красный факел|"))
	(halt)
)

(defrule Rule_75
	(declare (salience 40))
	(fact (name золотой_слиток))
	(fact (name палка))
	(fact (name красная_пыль))
	=>
	(assert (fact (name электрические_рельсы)))
	(assert(sendmessagehalt " золотой слиток + палка + красная пыль = электрические рельсы|электрические рельсы|"))
	(halt)
)

(defrule Rule_76
	(declare (salience 40))
	(fact (name доски_))
	(fact (name палка))
	=>
	(assert (fact (name кирка)))
	(assert(sendmessagehalt " доски + палка = кирка|кирка|"))
	(halt)
)

(defrule Rule_77
	(declare (salience 40))
	(fact (name железный_слиток))
	(fact (name палка))
	=>
	(assert (fact (name кирка)))
	(assert(sendmessagehalt " железный слиток + палка = кирка|кирка|"))
	(halt)
)

(defrule Rule_78
	(declare (salience 40))
	(fact (name золотой_слиток))
	(fact (name палка))
	=>
	(assert (fact (name кирка)))
	(assert(sendmessagehalt " золотой слиток + палка = кирка|кирка|"))
	(halt)
)

(defrule Rule_79
	(declare (salience 40))
	(fact (name алмаз))
	(fact (name палка))
	=>
	(assert (fact (name кирка)))
	(assert(sendmessagehalt " алмаз + палка = кирка|кирка|"))
	(halt)
)

(defrule Rule_80
	(declare (salience 40))
	(fact (name железный_слиток))
	=>
	(assert (fact (name ведро)))
	(assert(sendmessagehalt " железный слиток = ведро|ведро|"))
	(halt)
)

(defrule Rule_81
	(declare (salience 40))
	(fact (name ведро))
	(fact (name вода))
	=>
	(assert (fact (name ведро_воды)))
	(assert(sendmessagehalt " ведро + вода = ведро воды|ведро воды|"))
	(halt)
)

(defrule Rule_82
	(declare (salience 40))
	(fact (name лазуритовая_руда))
	=>
	(assert (fact (name лазурит)))
	(assert(sendmessagehalt " лазуритовая руда = лазурит|лазурит|"))
	(halt)
)

(defrule Rule_83
	(declare (salience 40))
	(fact (name доски_))
	=>
	(assert (fact (name вода)))
	(assert(sendmessagehalt " доски = вода|вода|"))
	(halt)
)

(defrule Rule_84
	(declare (salience 40))
	(fact (name железный_слиток))
	(fact (name железный_блок))
	=>
	(assert (fact (name вода)))
	(assert(sendmessagehalt " железный слиток + железный блок = вода|вода|"))
	(halt)
)

(defrule Rule_85
	(declare (salience 40))
	(fact (name палка))
	(fact (name нить))
	=>
	(assert (fact (name лук)))
	(assert(sendmessagehalt " палка + нить = лук|лук|"))
	(halt)
)

(defrule Rule_86
	(declare (salience 40))
	(fact (name железный_слиток))
	(fact (name красная_пыль))
	=>
	(assert (fact (name компас)))
	(assert(sendmessagehalt " железный слиток + красная пыль = компас|компас|"))
	(halt)
)

(defrule Rule_87
	(declare (salience 40))
	(fact (name костная_мука))
	=>
	(assert (fact (name белый_краситель)))
	(assert(sendmessagehalt " костная мука = белый краситель|белый краситель|"))
	(halt)
)

(defrule Rule_88
	(declare (salience 40))
	(fact (name дерево))
	(fact (name уголь))
	(fact (name палка))
	=>
	(assert (fact (name блок_слизи)))
	(assert(sendmessagehalt " дерево + уголь + палка = блок слизи|блок слизи|"))
	(halt)
)

(defrule Rule_89
	(declare (salience 40))
	(fact (name железный_блок))
	(fact (name железный_слиток))
	=>
	(assert (fact (name Наковальня)))
	(assert(sendmessagehalt " железный блок + железный слиток = Наковальня|Наковальня|"))
	(halt)
)

(defrule Rule_90
	(declare (salience 40))
	(fact (name железный_слиток))
	(fact (name палка))
	=>
	(assert (fact (name Мотыга)))
	(assert(sendmessagehalt " железный слиток + палка = Мотыга|Мотыга|"))
	(halt)
)

(defrule Rule_91
	(declare (salience 40))
	(fact (name доски_))
	(fact (name палка))
	=>
	(assert (fact (name Мотыга)))
	(assert(sendmessagehalt " доски + палка = Мотыга|Мотыга|"))
	(halt)
)

(defrule Rule_92
	(declare (salience 40))
	(fact (name золотой_слиток))
	(fact (name палка))
	=>
	(assert (fact (name Мотыга)))
	(assert(sendmessagehalt " золотой слиток + палка = Мотыга|Мотыга|"))
	(halt)
)

(defrule Rule_93
	(declare (salience 40))
	(fact (name алмаз))
	(fact (name палка))
	=>
	(assert (fact (name Мотыга)))
	(assert(sendmessagehalt " алмаз + палка = Мотыга|Мотыга|"))
	(halt)
)

(defrule Rule_94
	(declare (salience 40))
	(fact (name шерсть))
	(fact (name фиолетовый_краситель))
	=>
	(assert (fact (name цветная_шерсть)))
	(assert(sendmessagehalt " шерсть + фиолетовый краситель = цветная шерсть|цветная шерсть|"))
	(halt)
)

(defrule Rule_95
	(declare (salience 40))
	(fact (name жёлтый_краситель))
	(fact (name шерсть))
	=>
	(assert (fact (name цветная_шерсть)))
	(assert(sendmessagehalt " жёлтый краситель + шерсть = цветная шерсть|цветная шерсть|"))
	(halt)
)

(defrule Rule_96
	(declare (salience 40))
	(fact (name зелёный_краситель))
	(fact (name шерсть))
	=>
	(assert (fact (name цветная_шерсть)))
	(assert(sendmessagehalt " зелёный краситель + шерсть = цветная шерсть|цветная шерсть|"))
	(halt)
)

(defrule Rule_97
	(declare (salience 40))
	(fact (name синий_краситель_))
	(fact (name шерсть))
	=>
	(assert (fact (name цветная_шерсть)))
	(assert(sendmessagehalt " синий краситель  + шерсть = цветная шерсть|цветная шерсть|"))
	(halt)
)

(defrule Rule_98
	(declare (salience 40))
	(fact (name красный_краситель))
	(fact (name шерсть))
	=>
	(assert (fact (name цветная_шерсть)))
	(assert(sendmessagehalt " красный краситель + шерсть = цветная шерсть|цветная шерсть|"))
	(halt)
)

(defrule Rule_99
	(declare (salience 40))
	(fact (name розовый_краситель))
	(fact (name шерсть))
	=>
	(assert (fact (name цветная_шерсть)))
	(assert(sendmessagehalt " розовый краситель + шерсть = цветная шерсть|цветная шерсть|"))
	(halt)
)

(defrule Rule_100
	(declare (salience 40))
	(fact (name чернильный_мешок))
	=>
	(assert (fact (name чёрный_краситель)))
	(assert(sendmessagehalt " чернильный мешок = чёрный краситель|чёрный краситель|"))
	(halt)
)

(defrule Rule_101
	(declare (salience 40))
	(fact (name чёрный_краситель))
	(fact (name шерсть))
	=>
	(assert (fact (name цветная_шерсть)))
	(assert(sendmessagehalt " чёрный краситель + шерсть = цветная шерсть|цветная шерсть|"))
	(halt)
)

(defrule Rule_102
	(declare (salience 40))
	(fact (name красный_тюльпан))
	=>
	(assert (fact (name красный_краситель)))
	(assert(sendmessagehalt " красный тюльпан = красный краситель|красный краситель|"))
	(halt)
)

(defrule Rule_103
	(declare (salience 40))
	(fact (name подсолнечник))
	=>
	(assert (fact (name жёлтый_краситель)))
	(assert(sendmessagehalt " подсолнечник = жёлтый краситель|жёлтый краситель|"))
	(halt)
)

(defrule Rule_104
	(declare (salience 40))
	(fact (name красный_краситель))
	(fact (name жёлтый_краситель))
	=>
	(assert (fact (name оранжевый_краситель)))
	(assert(sendmessagehalt " красный краситель + жёлтый краситель = оранжевый краситель|оранжевый краситель|"))
	(halt)
)

(defrule Rule_105
	(declare (salience 40))
	(fact (name пион))
	=>
	(assert (fact (name розовый_краситель)))
	(assert(sendmessagehalt " пион = розовый краситель|розовый краситель|"))
	(halt)
)

(defrule Rule_106
	(declare (salience 40))
	(fact (name доски_))
	(fact (name палка))
	=>
	(assert (fact (name забор)))
	(assert(sendmessagehalt " доски  + палка = забор|забор|"))
	(halt)
)

(defrule Rule_107
	(declare (salience 40))
	(fact (name прополис))
	(fact (name пыльца))
	=>
	(assert (fact (name слизь)))
	(assert(sendmessagehalt " прополис + пыльца = слизь|слизь|"))
	(halt)
)

(defrule Rule_108
	(declare (salience 40))
	(fact (name блок_слизи))
	=>
	(assert (fact (name слизь)))
	(assert(sendmessagehalt " блок слизи = слизь|слизь|"))
	(halt)
)

(defrule Rule_109
	(declare (salience 40))
	(fact (name слизь))
	=>
	(assert (fact (name блок_слизи)))
	(assert(sendmessagehalt " слизь = блок слизи|блок слизи|"))
	(halt)
)

(defrule Rule_110
	(declare (salience 40))
	(fact (name палка))
	(fact (name нить))
	=>
	(assert (fact (name удочка)))
	(assert(sendmessagehalt " палка + нить = удочка|удочка|"))
	(halt)
)

(defrule Rule_111
	(declare (salience 40))
	(fact (name железный_слиток))
	=>
	(assert (fact (name ножницы)))
	(assert(sendmessagehalt " железный слиток = ножницы|ножницы|"))
	(halt)
)

(defrule Rule_112
	(declare (salience 40))
	(fact (name нить))
	=>
	(assert (fact (name шерсть)))
	(assert(sendmessagehalt " нить = шерсть|шерсть|"))
	(halt)
)

(defrule Rule_113
	(declare (salience 40))
	(fact (name железный_блок))
	=>
	(assert (fact (name железные_кусочки)))
	(assert(sendmessagehalt " железный блок = железные кусочки|железные кусочки|"))
	(halt)
)

