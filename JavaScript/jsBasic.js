
//
//  Date()
//



// Date() 和New Date()之间的区别
var c1 = Date();       //返回一个字符串（string），没有getDate等日期对象方法，内容为当前时间
console.log("===c1===" + c1);
var c2 = new Date();    //返回一日期对象，可以调用getDate()，内容为当前时间
console.log("===c2===" + c2);
var c3 = Date("2017-1-1");//返回一个字符串（string），内容仍旧为当前时间，也就是不受参数影响
console.log("===c3===" + c3);
var c4 = new Date("2017-1-1");//返回一日期对象，可以调用getDate()，内容为2017年元旦
console.log("===c4===" + c4);

// 
var myDate = new Date();
myDate.setFullYear(2018,4,25);
console.log("===myDate===" + myDate);

var time2 = myDate.Format("yyyy-MM-dd");
console.log("===time2===" + time2);

// 日期调整（向前，向后；自动处理月份增减）
myDate.setDate(myDate.getDate()+1);
console.log("===myDate add===" + myDate);

myDate.setDate(myDate.getDate()+1);
console.log("===myDate add===" + myDate);

var newDate = Date(myDate.getDate()+1);
console.log("===newDate===" + newDate);

// 输出的是相对时间？？？
var catologDate = myDate.setDate(myDate.getDate()+1);
console.log("===catologDate===" + catologDate);