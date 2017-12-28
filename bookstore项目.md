# GoOnBookstore

## 1.页面组成

主页:(bookstore)

![](https://ws1.sinaimg.cn/large/899fe517gy1fmnigzl804j211x0k6abx.jpg)

查看所有书目 : (catalog)

​	所有书目来自数据库,等到一个bookdetail 对象,然后,然后显示特定的信息就可以了

![](https://ws1.sinaimg.cn/large/899fe517gy1fmnihs3l38j20fw0lbn03.jpg)

书的细节:()

![](https://ws1.sinaimg.cn/large/899fe517gy1fmnihs3l38j20fw0lbn03.jpg)

书的细节图:(bookdetail)

![](https://ws1.sinaimg.cn/large/899fe517gy1fmnjibej1fj20ay0ka3zd.jpg)

加入购物车:

![](https://ws1.sinaimg.cn/large/899fe517gy1fmnjjd7nsuj20dd0k8wgj.jpg)

查看购物车:(showcart)

![](https://ws1.sinaimg.cn/large/899fe517gy1fmnjk29adej20dt0k775e.jpg)

付款:(cashier)

![](https://ws1.sinaimg.cn/large/899fe517gy1fmnjkwxqj9j20ai0in0td.jpg)

提交以后:(receipt)

![](https://ws1.sinaimg.cn/large/899fe517gy1fmnjlpiw71j20b10k4gm9.jpg)









## 2.页面实现思路

* ​


* 主页(bookstore.jsp)

* 书列表页(booklist.jsp)

* 书的细节页(bookdetail.jsp)

* 购物车(shoppingcar.jsp)

* 提交界面(receipt.jsp)

* 付款页(bookpay.jsp)

* 共同页面(common.jsp):包括错误界面,和引用的类

  其中:

  ![](https://ws1.sinaimg.cn/large/899fe517gy1fmnjwuyfssj209c026q2s.jpg)

  可以给各个页面复用,包括:

---

## 3.各部分所需要的包和类

- been 

  - book

  - shoppingcar

    ​

- xxx

  ​

## 4.数据库设计

数据库:

bookstore

表:

book

- author(作者)

- id : 主键

- 价钱

- 书名

  ​

  ​

## 5.