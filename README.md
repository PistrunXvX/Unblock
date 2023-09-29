# Игра: "Unblock"

## TO-DO Лист

Здесь описан порядок и важность того, что нужно сделать.

| Порядок: |                Важно сделать:                 |           Важно, но не обязательно:           |
| :------: | :-------------------------------------------: | :-------------------------------------------: |
|    1     |               [Камера](#камера)               |     [Настольная лампа](#гнастольнаялампа)     |
|    2     |   [Система тайм-лайна](#гсистема-таймлайна)   |     [Система диалогов](#гсистемадиалогов)     |
|    3     |              [Стамины](#стамины)              | [Стационарный телефон](#гстационарныйтелефон) |
|    4     | [Работа](#гработа) / [Рубильник](#грубильник) |          [Щиток света](#гщитоксвета)          |
|    5     |      [Список клиентов](#гсписокклиентов)      |                                               |
|    6     |             [Игрушка](#гигрушка)              |                                               |
|    7     |                [Часы](#гчасы)                 |                                               |
|    8     |               [Радио](#градио)                |                                               |
|    9     |           [Кофеварка](#гкофеварка)            |                                               |

## Жанр

Жанр игры — **Point & Click**, **Time/Resurse management**, **головоломка**. 
Игры подобного жанра: [Papers, Please](https://store.steampowered.com/app/239030/Papers_Please/), [Do Not Feed the Monkeys](https://store.steampowered.com/app/658850/Do_Not_Feed_the_Monkeys/), [Not For Broadcast](https://store.steampowered.com/app/1147550/Not_For_Broadcast/)

## Синопсис

-

## Управление

### <a id = "движение камеры">  **Движение камеры:** </a>

- **Мышкой:**
  - Движение мышкой – Касаясь края экрана *(сверху, слева, снизу, справа)* происходит смена экрана.
- **Клавиатурой:**
  - W, A, S, D **(WASD)** – Вверх, влево, вниз, вправо.

### **Интеракция с объектами:**

- Левая кнопка мышки **(ЛКМ)**, **E** – Использовать / Нажать на объект.
- Правая кнопка мышки **(ПКМ)** – Вывести информацию о объекте.
- ⬆️, ⬅️, ⬇️, ➡️ **(Стрелочки)**  – Переключиться между объектами на экране.

### **Внутри диалога:**

- **E**, **Enter**, **(ЛКМ)** – Выбрать вариант ответа.
- **Space** – Пропустить текстовое окно.
- ⬆️, ⬅️, ⬇️, ➡️ **(Стрелочки)**  – Переключиться между ответами в диалоге.

## Системы и механики

### <a id = "гкамера">  **Камера:** </a>

Игра разделена на 6 секций *(Экранов)* каждая размером 16:9 *(1920x1080)*, камера игрока прикреплена ровно по размеру одной секции *(1920x1080)*. Перемещение между секциями реализовано за счёт **[Движение камеры 🔼](#движение камеры)**. В зависимости от того, на каком экране находится игрок, он может моментально переместиться только на экраны находящиеся рядом. *<u>(Смотреть рисунок ниже)</u>* Красными стрелками выделено с какого экрана на какой можно переместиться. 

⚠️ **Для большей тех.инфы смотреть: [Параметры 🔽](#параметры) / [Камера ⏬](#Камера)**

![Рисунок 1 (Секции экранов)](https://s2.loli.net/2023/09/27/FXrHJSUGwmTcx13.jpg)

### <a id = "гсистема-таймлайна">  **Система тайм-лайна:** </a>

У игры есть строго определенный тайм-лайн, *(начало и конец уровня)*. В версии гейм-джема у нас будет 1 уровень, который длиться **N-кол.во** минут реального времени и **N-кол.во** часов внутриигрового времени. *(За что будут отвечать внутриигровые часы)* Система тайм-лайна нужна для того, что-б вызывать определенные события в определенном порядке.

⚠️ **Для большей тех.инфы смотреть: [Параметры 🔽](#параметры) / [Тайм-лайн игры ⏬](#таймлайнигры)**

![Group 3.jpg](https://s2.loli.net/2023/09/27/vhdVDZ3ON4xQpJr.jpg)

### <a id = "стамины">Стамины:</a>

"Здоровье", "усталость", "увольнение". 

У персонажа существует два вида стамины, которые отображаются оверлеем справа сверху.

- 1 - Сонливость, скука **(Усталость)**. Усталость – это динамическая шкала. Шкала усталости ровна **N-ед** (в начале игры она ровна нолю) и каждую **N-кол.во** секунд заполняется на **N-ед**. Для того что-б понизить скорость пополнения шкалы усталости или просто снизить усталость игрок должен выполнять определенные действия, которые будут снижать шкалу усталости.
- 2 - Ментальное состояние **(Здоровье)**. Здоровье выдается в начале уровня, шкала здоровья ровна **N-ед** и никак не может быть восполнена. При совершении ошибок *(Негативные события, ключевые события)* шкала здоровья падает. При достижении отметки в 0 игрок "умирает". 

<img src="https://s2.loli.net/2023/09/30/HfIUKjkp1DqWls3.jpg" alt="Стамины.jpg" style="zoom:200%;" />

В игре так же существует невидимая для игрока шкала **"недовольства начальника"**.

- 3 - Ошибки на службе, недовольство начальника **(Увольнение)**. Данная шкала отвечает за подсчёт ошибок связанных с работой игрока. Если игрок совершает **N-кол.во** ошибок *(Ключевые события, негативные события)*, происходят пополнение этой "шкалы" и следующие три события при достижении определенной отметки:
  - Стадия 1-ая, (**N-кол.во **ошибок). Если игрок ошибается **N-кол.во** раза *(Негативные события, ключевые события)* то начальник звонит на стационарный телефон и ругает игрока.
  - Стадия 2-ая (**N-кол.во **ошибок). Если игрок ошибается **N-кол.во** раза *(Негативные события, ключевые события)* то начальник звонит на стационарный телефон и ругает игрока, говоря что это был последний раз.
  - Стадия 3-ая (**N-кол.во** ошибок). Если игрок ошибается **N-кол.во** раз, то игра заканчивается "увольнением".

⚠️ **Для большей тех.инфы смотреть: [Параметры 🔽](#параметры) / [Стамина ⏬](#пстамина)**

### <a id = "гмеханикасобытий">Механика событий:</a>

**События** — это внутриигровые препятствия и отвлекающие факторы, которые нужно преодолеть игроку и которые заранее расставлены нами. События разделяются на следующие категории:

- **Ключевые события.** События, при которых игрок может как потерять так и восполнить [стамину](###Стамины), в зависимости от его сообразительности и выбора действий. Исход события: *(+1, 0, -1)*
- **Негативные события.** События, при которых игрок теряет часть одной из [стамин](###Стамины) если не решит их, и избегает потери [стамины](###Стамины), если решит. Исход события: (0, -1)
- **Позитивные события.** События, при которых игрок восполняет часть одной из [стамин](###Стамины), если не решит их то не будет негативных последствий. Исход события: (+1, 0)
- **Отвлекающие события.** События, которые никак не влияют на [стамину](###Стамины), но которые нацелены отвлечь игрока от других событий. Исход события: (0)

События могут накладываться друг на друга и создавать конфликтные ситуации, когда игроку нужно выбрать сделать одно или другое. *<u>(Смотреть набросок уровня ниже)</u>*

⚠️ **Для большей тех.инфы смотреть: [Параметры 🔽](#параметры) / [События ⏬](#псобытия)**

![Уровень.jpg](https://s2.loli.net/2023/09/27/5DLidwSlK7M3YFj.jpg)

### <a id = "гработа">Работа:</a>

Механика работы является основной и принадлежит к "Ключевым событиям". Геймплейный луп работы заключается в следующих шагах:

⚠️ **Для большей тех.инфы смотреть: [Параметры 🔽](#параметры) / [Работа ⏬](#пработа)**

![ГеймплейныйЛуп.jpg](https://s2.loli.net/2023/09/28/8ymorKCGfthx6vz.jpg)

### <a id = "гсистемадиалогов">Система диалогов:</a>

Диалоговая система внутри игры включается иногда вместе с событием *(Любым из типов событий)*. Во время диалога время *(Тайм-лайн игры)* не останавливается и продолжает идти. Во время диалога, иногда так же может всплыть возможность выбора ответов, а вместе с ней и ограниченное время на выбор ответа. В зависимости от события и действий игрока результат может быть разным.

![Group 15.jpg](https://s2.loli.net/2023/09/28/AU6CEXiHZnMBTsg.jpg)

### Интерактивные объекты:

Интерактивные объекты — это объекты через которые игрок будет решать те или иные события, а так же восполнять стамину. Ниже приведен список объектов и на что они влияют:

#### **<a id = "гчасы">Часы:</a>**

Самые обычные часы, которые показывают внутриигровое время.

⚠️ **Для большей тех.инфы смотреть: [Параметры 🔽](#параметры) / [Тайм-лайн игры ⏬](#таймлайнигры)**

#### **<a id = "грубильник">Рубильник:</a>**

Три кнопки, которые отвечают за закрытие и открытие шлагбаума, а также за вызов охранника.

- **Кнопка открыть**. Открывает шлагбаум, дает пройти автомобилю.
- **Кнопка закрыть.** Закрывает шлагбаум, обязательно нужно нажимать после того как проедет машина.
- **Кнопка охраны.** Вызывает охранника, который заставляет уехать машину стоящую перед шлагбаумом.

Кнопки так же могут не работать если они **отключены от электричества**.*(Смотреть раздел <u>щиток света</u>)*

⚠️ **Для большей тех.инфы смотреть: [Параметры 🔽](#параметры) / [Рубильник ⏬](#пработа)**

#### <a id = "гсписокклиентов">Списокклиентов:</a>

Несколько листов бумаги, с информацией о клиентах. Изначально лежат на экране и игрок не можеет увидеть, что на них написано, поэтому снала ему нужно нажать на область где лежат листы с бумагами, после чего откроется новое окно где будут полностью видны бумаги. Однако могут-быть также и усложняющие обстоятельства.

- Листов может-быть несколько (но он всегда больше чем 1).
- Среди листов может-быть лист с неправильной датой.
- На листах может-быть что-то зачеркнуто, или плохо "отсканировано".
- На листах могут быть пятна, плевки, рисунки, след от кофе и т.д.

![СписокКлиентов на сегодня.jpg](https://s2.loli.net/2023/09/28/86X5sxEVqFbZfiP.jpg)

##### <a id = "гнастольнаялампа">Настольная лампа:</a>

Настольная лампа, которая освещает стол позволяя рассматривать бумаги, имеет следующие состояния:

- **Отключено от электричества.** Лампа не работает, игрок ПОЧТИ не видит текста на бумаге, для включения лампы нужно обратно запитать её электричеством *(Смотреть раздел <u>щиток света</u>)*
- **Включена.** Лампа светит, бумажки видно.
- **Выключена.** Лампа не светит, бумажки ПОЧТИ не видно.

#### **<a id = "гстационарныйтелефон">Стационарный телефон:</a>**

Телефон на который может прийти звонок от работодателя, жены или спам-агенств. Телефон может иметь несколько состояний:

- **Отключено от электричества.** Телефон не работает, игроку не поступают звонки, для начала нужно запитать обратно электричеством *(Смотреть раздел <u>щиток света</u>)*
- **Стоит.** Просто стоит и ничего не делает.
- **Звонит.** Издает звуки и мигает лампочка, пытается привлечь внимание игрока.
- **Поднять трубку.** Трубка находится у уха игрока, он может выбирать варианты ответов в диалоге.
- **Трубка положена на стол.** Игрок все ещё может читать и наблюдать за диалогом, но функция выбора ответов для него отключена, пока он снова не поднимет трубку.

#### <a id = "градио">**Радио:**</a> 

Настольное радио, которое уменьшает скуку на **N-ед** если настроено хоть на какую-нибудь радиостанцию. У радио есть особенность, примерно каждые  **N-кол.во** секунд частота радиостанции сбивается, поэтому игрок будет должен тратить время на её настройку играя в мини игру.

<img src="https://s2.loli.net/2023/09/28/tiTqWENLhSv3Anm.jpg" alt="Радио.jpg" style="zoom:50%;" /> Мини игра в радио заключается в простом подборе верной частоты.

У радио так же есть следующие состояния, которые влияют на **стамину** игрока.

- **Отключено от электричества.** Радио не работает, игрок не может его включить, для начала нужно запитать обратно электричеством *(Смотреть раздел <u>щиток света</u>)*
- **Выключено.** Радио не работает или выключено, оно не издает никаких звуков.
- **Включено - шум.** Радио работает, но не настроено, **усталость** игрока накапливается в **N-ед** раз быстрее.
- **Включено - радиостанция.** Радио работает и передает музыку или голоса дикторов какой-то радиостанции. Игрок накапливает **усталость** в **N-ед** медленнее.
- **Настраивается.** Радио настраивается игроком, оно издает шум, но этот шум никак не влияет на **усталость** игрока.

⚠️ **Для большей тех.инфы смотреть: [Параметры 🔽](#параметры) / [Радио ⏬](#прадио)**

#### <a id = "гигрушка">**Игрушка:**</a> 

На **Экране 5** игрок будет держать телефон в руках и играть в очень простенькую игрушку, которая будет убавлять **усталость** на **N-ед** каждую секунду. 

Варианты игрушек на реализацию:

1. Динозаврик от гугла (тот когда нет интернета).
2. Cookie Clicker, но без прокачки.
3. Три в ряд, но без уровней и бесконечный.

⚠️ **Для большей тех.инфы смотреть: [Параметры 🔽](#параметры) / [Игрушка ⏬](#пигрушка)**

#### <a id = "гкофеварка">**Кофеварка:**</a> 

Кофеварка позволяет сделать кофе если взять рядом стоящие ингредиенты и засунуть их в неё. После того, как ингредиенты засунуты, а кофеварка включена, она работает на протяжении **N-кол.во** секунд, по истечению этого времени издается звук означающий завершения приготовления кофе. После чего игрок должен взять графин и налить себе в кружку кофе. Теперь при нажатии на кружку игрок будет снимать **N-ед** **усталости**. Всего игрок может сделать **N-кол.во** таких глотка.

У кофеварки так же есть следующие состояния:

- **Отключено от электричества.** Кофеварка не работает, игрок не может её включить, для начала нужно запитать обратно электричеством. *(Смотреть раздел <u>щиток света</u>)* Если кофеварка в момент отключения электричества работала, то её придется обратно включить и заново ждать **N-кол.во** секунд.
- **Кофеварка стоит НЕ НАПОЛНЕНА.** Кофеварка стоит, в ней нет никаких ингредиентов. Если попытаться включить, то она не включится.
- **Кофеварка стоит НАПОЛНЕНА.** Кофеварка стоит, в ней есть ингредиенты, если её включить то она перейдет в состояние **Кофеварка работает.**
- **Кофеварка работает.** Кофеварка работает, издает звуки и отсчитывает таймер до приготовления. По истечению таймера переходит в состояния **Кофеварка кофе готов.**
- **Кофеварка кофе готов.** Кофеварка сделала кофе, теперь кофе можно налить в кружку.

⚠️ **Для большей тех.инфы смотреть: [Параметры 🔽](#параметры) / [Кофеварка ⏬](#пкофеварка)**

![Кофеварка.jpg](https://s2.loli.net/2023/09/28/VmeIh1AFiax7vJ9.jpg)

#### <a id = "гщитоксвета">**Щиток света:**</a> 

Щиток света который отвечает за свет в будке и за работу таких приборов как: Рубильник, настольная лампа, стационарный телефон, радио, кофеварка.

![Щиток света](https://s2.loli.net/2023/09/28/KF4Syx5MoND9s6Y.jpg)

Иногда могут происходить случайные **Негативные** и **Отвлекающие события**, которые заставят игрока перейти к мини-игре с щитком и включить обратно выключенный/выключенные прибор/приборы. Так же может произойти **Негативное событие** с отключением абсолютно всех приборов, если все приборов, а вместе с ними и света.

Для того что-б включить обратно приборы игрок должен переместить на экран с щитком и посмотрев на лампочки, сопоставив какая лампочка к какому переключателю соотносится и обратно включить. Дабы игроки бездумно не кликали на переключатели, после **N-кол.во** нажатий на переключатели игрока "ударяет током" снимая ему **N-ед** **здоровья**.

⚠️ **Для большей тех.инфы смотреть: [Параметры 🔽](#параметры) / [Щиток света ⏬](#пщитоксвета)**

### Энд-скрин:

Система энд-скрина нужна для того что-б завершить уровень. Энд-скрин представляет из себя картинку с информацией о том, справился ли игрок с работой или нет. Примерный список энд-скринов:

- **Стамина** игрока отвечающая за **усталость** наполнилась полностью. Игрок "заснул" ему показали уникальный энд-скрин увольнения.
- **Стамина** игрока отвечающая за **здоровье** иссякла полностью. Игрок "умер" ему показали уникальный энд-скрин "смерти".
- **Стамина** отвечающая за **увольнение** наполнилась полностью. Игрока "уволили" ему показали уникальный энд-скрин увольнения.
- Игрок смог дожить до конца рабочей смены. Игроку показывают энд-скрин как персонаж отправляется домой отдыхать.
- И т.д.

## <a id = "параметры">  **Параметры:** </a>

### [⏫](#гкамера) <a id = "Камера">  **Камера:** </a>

При перемещении из секции А в секцию Б происходит плавная анимация смены камеры **["easeOutCubic"](https://easings.net/#easeOutCubic)** длительностью в 0.75 секунд. При этом игрок НЕ может моментально переместиться с Экрана 6 на Экран 1.

### [⏫](#гсистема-таймлайна) <a id = "таймлайнигры">  **Тайм-лайн игры:** </a>

Уровень длиться **10 минут реального времени** и **8 часов внутриигрового времени**.

Минутная стрелка <u>внутриигровых часов</u> совершает полный оборот (**60** минут) за **75** секунд <u>реального времени</u>. 
**1** тик минутной стрелки <u>внутри игры</u> = **1.25** секунд <u>реального времени</u>.

### [⏫](#стамины) <a id = "пстамина">  **Стамина:** </a>

- **Здоровье.** Здоровье ровно **100 Ед**, оно статично.
- **Усталость.** Усталость ровна **100 Ед**, с начала игры она равна **0 Ед**.
  - **К**оэффициент **Н**акапливания **У**сталости **(КНУ)** - каждую секунду **реального времени** она заполняется на **1.5 Ед**. 
- **Увольнение.** Шкала увольнение ровно **5 Ед** она статична.

### [⏫](#гмеханикасобытий) <a id = "псобытия">  **События:** </a>

- **Ключевые события.** Ключевое событие может принести игроку:
  - **+ N-ое** кол-во **N стамины**.
  - **− N-ое** кол-во **N стамины**.
  - **Ничего.**
- **Негативные события.** Негативное событие может принести игроку:
  - **− N-ое** кол-во **N стамины**.
  - **Ничего.**
- **Позитивные события.** Позитивное событие может принести игроку:
  - **+ N-ое** кол-во **N стамины**.
  - **Ничего.**
- **Отвлекающие события.** Отвлекающие событие может принести игроку:
  - **Ничего.**

### [⏫](#гработа) <a id = "пработа">  **Работа / Рубильник:** </a>

1. Машины
   - Подъезжает за **3** секунды.
   - Шлагбаум открыт?
     - **Да.**
       - Заезжает за **3** секунды.
     - **Нет.**
       - Ожидание **15** секунд.
       - После **15-ой** секунды начинает бибикать раз в **5** секунд, звуковой сигнал длиться **1** секунду.
       - После **30-ой** секунды уезжает.
       - Уезжает за **3** секунды.
2. Шлагбаум
   - Нажимаем на кнопку **"открыть"**.
     - Шлагбаум открыт?
       - **Нет.** Сразу активирует анимацию **"поднять шлагбаум"** и разрешаем машине проехать.
         - Анимация **"поднять шлагбаум"** длиться **2** секунды.
       - **Да**. Ничего не делаем.
   - Нажимаем на кнопку "закрыть".
     - Шлагбаум закрыт?
       - **Нет.** Проезжает ли сейчас автомобиль?
         - **Нет.** Сразу активирует анимацию **"опустить шлагбаум"** и запрещаем машинам проезжать.
           - Анимация **"опустить шлагбаум"** длиться **1** секунду.
         - **Да.** Блокируем возможность закрыть шлагбаум.
       - **Да**. Ничего не делаем.
3. Охрана
   - Нажимаем на кнопку **"охрана"**.
     - Охрана выходит через **2** секунду, проходит к автомобилю за **2** секунды стоит там **2** секунды, прогоняет автомобиль (Автомобиль уезжает за **3** секунды) охрана возвращается обратно за **2** секунды.

### [⏫](#градио)<a id = "прадио">  **Радио:** </a>

Состояния радио:

- Если радио **"включено - шум"**: 
  - **(КНУ)** игрока накапливается на **0.25 Ед** быстрее.
- Если радио **"включено - радиостанция"**:
  - **(КНУ)** игрока накапливается на **0.5 Ед** медленее.

### [⏫](#гигрушка)<a id = "пигрушка">  **Игрушка:** </a>

- Если игрок играет в игрушку на протяжении больше **3** секунд то **КНУ** игрока накапливается на **1.5 Ед** медленее.

### [⏫](#гкофеварка) <a id = "пкофеварка">  **Кофеварка:** </a>

Порядок действий и количество предметов:

<a id = "пингредиенты">  **Ингредиенты:**</a> — Это предметы, которые нужны для того, что-б запустить кофеварку и заварить кофе. Эти ингредиенты <u>НЕ восполняются</u> и <u>НЕ респавнятся</u> повторно, их можно использовать только один раз.
<a id = "пкружка">  **Кружка:**</a> — Это предмет стоящий на столе, имеющий несколько состояний: **Пустая**, **кофе на 1/3**, **кофе на 2/3**, **полная (3/3)**. Полная кружка кофе имеет **3 Ед** **использования**, каждая **1 Ед использования** снимает **15 Ед** **усталости** у игрока и убирает **1 Ед использования**.

- На уровне около кофеварки есть **N-кол.во** **ингредентов:** <u>Сахар</u>, <u>Кофе</u>, <u>Вода</u>. 
- Игрок должен взять по **1 Ед** предметов: Сахар, кофе, вода и положить в кофеварку. 
- Игрок должен нажать на кнопку **"запустить кофеварку"**.
  - Если **ингредиенты:** Сахар, кофе, вода <u>не положены</u>, то нажатие на кнопку **"запустить кофеварку"** издаст звук **"ошибки"**.
  - Если **ингредиенты:** Сахар, кофе, вода <u>положены</u>, то нажатие на кнопку **"запустить кофеварку"** запустит работу кофеварки и в течении **30 Секунд** будет издавать звук работы.
- По истечении времени издастся звук **"завершения работы"**, и кофе переливается в графин.
- Игрок должен <u>взять</u> графин и <u>налить</u> в кружку кофе.

### [⏫](#гщитоксвета) <a id = "пщитоксвета">  **Щиток света:** </a>

**Отключение** — Меняет состояние предмета на отключен из сети.
**Включение** — Меняет состояние предмета на состояние до отключения.
**Предмет** —  Рубильник, настольная лампа, стационарный телефон, радио, кофеварка.

**"Отруб"** *(Отвлекающее событие)* – Событие при котором происходит **Отключение** + **Предмет**. Из-за чего игроку надо переместиться к щитку и пройти мини-игру **"Кнопочки"**.

**"Подсчёт переключений"** – Каждый раз когда игрок использует переключатель мы подсчитываем это. Если игрок переключил **6 Раза** неправильно, то мы снимаем ему **15 Ед** **здоровья**. Это правило работает на <u>ВСЕ</u> переключатели <u>одновременно</u>.

**Мини-игра "Кнопочки":**

- Игрок должен переместиться на экран с щитком.
- Игрок должен посмотреть какие лампочки *(слева)* горят каким цветом.
  - Если лампочка горит **зеленым**, значит всё окей.
  - Если лампочка горит **красным:**
    - Посмотреть к какому переключателю *(справа)* тянется провод от лампочки и переключить на **2 Шаг** в противоположную сторону.
      - Лампочка загорелось **зеленным** произошло событие **Включение** + **Предмет**.
  - Если лампочка горит **оранжевым:**
    - Посмотреть к какому переключателю *(справа)* тянется провод от лампочки и переключить на **1 Шаг** в нужную сторону:
      - Т.к переключатель находится в положении по середине, то игрок с шансом 50 на 50 может переключить либо в правильное положение либо не в правильное.
        - Переключил в <u>правильное</u>? Лампочка загорелось **зеленным** произошло событие **Включение** + **Предмет**.
        - Переключил в <u>неправильно</u>? Лампочка загорелась **красным** см.пункт выше.

## Интерфейс:

#### Экраны:

- **Экран 1:** На этом экране мы видим окно, часть стены снизу и слева, а так же часть стола справа. В окне мы можем увидить машину, её номер, цвет и марку, а также работу шлагбаума *[(См.Работа)](#гработа)*.
- **Экран 2:** На этом экране мы видим часть окна слева, стенку спереди на которой весят [часы](#гчасы) и стол на котором лежит [стационарный телефон](#гстационарныйтелефон), [список клиентов](#гсписокклиентов), [радио](#градио) и [настольная лампа](#гнастольнаялампа), которая светит на [список клиентов](#гсписокклиентов).
- **Экран 3:** На этом экране мы видим стенку с закрытыми и открытыми полками в которых лежат [ингредиенты](#пингредиенты), на столе мы видим [кофеварку](#гкофеварка) и [кружку](#пкружка).
- **Экран 4:** На этом экране мы видим стенку с [рубильником](#грубильник) на нем, а снизу пол.
- **Экран 5:** На этом экране мы видим то, что под столом и держим в руках [игрушку](#гигрушка). 
- **Экран 6:** На этом экране мы видим то, что под столом и так же видим [щиток света](#гщитоксвета).

![Всепредметы.jpg](https://s2.loli.net/2023/09/30/MxQvbDpV3h5mrwC.jpg)

#### Оверлей:

Вне зависимости на каком экране мы находимся мы всегда видим справа сверху **[стамину](###Стамины) здоровья** и **[стамину](###Стамины) усталости**.

<img src="https://s2.loli.net/2023/09/27/NwC1KRkSJ83z2si.jpg" alt="Стамины" style="zoom:100%;" />

## Дизайн

### **Визуальный дизайн:**

Визуальный дизайн игры представляет из себя смесь пиксель-арта [Papers, Please](https://store.steampowered.com/app/239030/Papers_Please/), [Do Not Feed the Monkeys](https://store.steampowered.com/app/658850/Do_Not_Feed_the_Monkeys/), [The Red Strings Club](https://store.steampowered.com/app/589780/The_Red_Strings_Club/), [Dead End Road](https://store.steampowered.com/app/448580/Dead_End_Road/) и [Backbone](https://store.steampowered.com/app/865610/_/?l=greek&snr=1_1056_4_1056_1057&curator_clanid=36024928), но не уходящего в жесткий пиксель-арт типу [Katana ZERO](https://store.steampowered.com/app/460950/Katana_ZERO/), [Bamerang](https://store.steampowered.com/app/1236490/Bamerang/), [Colt Canyon](https://store.steampowered.com/app/940710/Colt_Canyon/), а скорей придерживающийся в рамках "размытого" пиксель-арта где аут-лайн*(контур и обвод)* слегка размыт по типу рисунков: [Sully](https://www.artstation.com/artwork/qkoBy), [MAK](https://twitter.com/MakDeetsMuch/status/1705984424125567314), [franrek](https://www.artstation.com/artwork/kDXO52). Лучше всего подобный визуал показан в [VA-11 Hall-A](https://store.steampowered.com/app/447530/VA11_HallA_Cyberpunk_Bartender_Action/). 

В варианте с нашей игрой мы <u>ограничемся небольшим количеством цветов</u> *(от 5 до 20)* как это сделано в игре [Milk outside a bag of milk outside a bag of milk](https://store.steampowered.com/app/1604000/Milk_outside_a_bag_of_milk_outside_a_bag_of_milk/), визуальный дизайн которой тоже неплохо подходит визуальному дизайну нашей игры. 

⚠️ Общая доска со всеми референсами: **[ССЫЛКА](https://www.figma.com/file/sDtECPOJHwtKfAJL8l81XG/%D0%A0%D0%B5%D1%84%D0%B5%D1%80%D0%B5%D0%BD%D1%81%D1%8B-%D0%B4%D0%BB%D1%8F-%D0%B8%D0%B3%D1%80%D1%8B?type=design&node-id=0-1&mode=design&t=ppCvWw6yZryCtngZ-0)**

#### Общая атмосфера:

Атмосфера игры <u>*в сумме*</u> отдалено напоминает такие игры как [Papers, Please](https://store.steampowered.com/app/239030/Papers_Please/), [Неясное](https://store.steampowered.com/app/2435180/_/?l=russian) и [Beholder](https://store.steampowered.com/app/475550/Beholder/) тем, что персонаж находится в <u>слегка</u> анти-утопичном мире с антуражом "пост-советской" страны или России 1990-2000г-ов. Однако атмосфера игры НЕ должна погружать в полное уныние, отчаяние и депрессию, а скорей напоминать "меланхоличное прошлое", как это сделано в [ШХД: ЗИМА](https://store.steampowered.com/app/1003360/___ITS_WINTER/?l=russian), [Militsioner](https://store.steampowered.com/app/1373530/Militsioner/) и [Bright Lights of Svetlov](https://store.steampowered.com/app/1630920/Bright_Lights_of_Svetlov/). Игрок должен почувствовать схожую атмосфера и вайб от мира игры как от [PAPERS, PLEASE - The Short Film](https://www.youtube.com/watch?v=YFHHGETsxkE), [Брат 2](https://www.kinopoisk.ru/film/41520/) и [Фарго (сезон 1)](https://ru.wikipedia.org/wiki/Фарго_(сезон_1)). 

⚠️ Общая доска со всеми референсами: **[ССЫЛКА](https://www.figma.com/file/sDtECPOJHwtKfAJL8l81XG/%D0%A0%D0%B5%D1%84%D0%B5%D1%80%D0%B5%D0%BD%D1%81%D1%8B-%D0%B4%D0%BB%D1%8F-%D0%B8%D0%B3%D1%80%D1%8B?type=design&node-id=0-1&mode=design&t=ppCvWw6yZryCtngZ-0)**

#### Дизайн окружения:

Окружение игрока *(то, что он большую часть игры наблюдает)*, это пост-советская, довольно старая и обветшалая, бетонная КПП будка. Внутри этой будки находятся следующие просто визуальные предметы и интерактивные предметы.

Часы

Рубильник

Список клиентов на сегодня

Стационарный телефон

Радио

Игрушка

Кофеварка

Щиток света

#### Дизайн персонажей:

-

#### Дизаний локаций:

-



### Звуковой дизайн:

#### **Аудио-концепция**

#### **Звуковые эффекты**









