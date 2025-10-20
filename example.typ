#import "@preview/zebraw:0.5.5": *
#import "style/specification.typ": *

#show: zebraw
#show: zebraw-init.with(
    lang: true,
    background-color: rgb("#1d2433"),
    highlight-color: rgb("#2d4640"),
    comment-color: rgb("#2f3645"),
    lang-color: rgb("#0d4443"),
)
#show: style.with(
    title: "Example",
    number: "#001-007",
    author: (
        name: "Norimasa TAKANA",
        organization: [University of Tsukuba],
        email: "alignof@outlook.com",
    ),
    date: datetime(year: 2025, month: 10, day: 20),
    time_limit: datetime(hour: 0, minute: 15, second: 0),
)

= 作問者より一言
これは装置の仕様書の例です．テンプレートを埋めるだけで簡単に問題文を作成することができます．

= 回路
回路を構成する部品を @parts に示す．
#figure(
    table(
        stroke: (x: none),
        columns: 3,
        table.header([部品名], [個数], [データシート]),
        [???],
        [1],
        [#link("https://akizukidenshi.com/goodsaffix/hc-sr04_v20.pdf")],
    ),
    caption: [部品一覧],
)<parts>

= ソースコード
装置に書き込まれたプログラムを以下に示す．
```cpp
struct Challenge RedOrBlue = {
    .gaming = red_or_blue,
    .setup_pin = setup_rob,
    .time_limit = 300,
};

// giver pin assgin
const uint8_t RED_WIRE = 23;
const uint8_t BLUE_WIRE = 18;

void setup_rob(void) {
	pinMode(RED_WIRE,  INPUT_PULLUP);
	pinMode(BLUE_WIRE, INPUT_PULLUP);
}

void red_or_blue(void *pvParameters) {
	bool flag1 = false;
	bool flag2 = false;

	while(1) {
		flag1 = (digitalRead(RED_WIRE)  == HIGH);
		flag2 = (digitalRead(BLUE_WIRE) == HIGH);

		// succeeded
		if(flag1) {
            succeeded();
		}

		// failed
		if(flag2) {
            failed();
		}
	}
}
```
