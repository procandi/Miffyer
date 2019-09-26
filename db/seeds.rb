# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



User.create!([
  {worksense_id: nil, uid: "9999", upw: "1111", uname: "管理員", utitle: "管理員", session_token: "6e752cee5b9f773fed2abb2da1d54132b0d05451"},
  {worksense_id: nil, uid: "2531", upw: "2531", uname: "孫茂勝", utitle: "醫師", session_token: "655ecbf5b72f1fda91928a1c090807784b22a657"},
  {worksense_id: nil, uid: "394", upw: "394", uname: "林國川", utitle: "醫師", session_token: "aee7462edc56803d77d40d5d1ae430978dad887e"},
  {worksense_id: nil, uid: "18840", upw: "18840", uname: "吳順生", utitle: "醫師", session_token: "2a29604dde78d79ef7724d37b45c0fd6991707a7"},
  {worksense_id: nil, uid: "35301", upw: "35301", uname: "蘇維文", utitle: "醫師", session_token: "a1106293e571db7e731e3026a54e59ecbac694d1"},
  {worksense_id: nil, uid: "60909", upw: "60909", uname: "范泉山", utitle: "醫師", session_token: "9b53cd8db58c2ab32f8bba880425d560bb89096e"},
  {worksense_id: nil, uid: "77149", upw: "77149", uname: "徐友春", utitle: "醫師", session_token: "195e75dfec366225f25e258b7199fd0d0f947b9b"},
  {worksense_id: nil, uid: "84798", upw: "84798", uname: "周昆慶", utitle: "醫師", session_token: "578257f61e81eb6e6fd898bc82249660dfcfe80a"},
  {worksense_id: nil, uid: "91646", upw: "91646", uname: "顏旭亨", utitle: "醫師", session_token: "e9b5f6dea2855daf7db9c78b6104cdd999c7b9ff"},
  {worksense_id: nil, uid: "97601", upw: "97601", uname: "楊佳偉", utitle: "醫師", session_token: "3cac5ae8e33fd233a2ecb3866f8de322cd659be4"},
  {worksense_id: nil, uid: "107400", upw: "107400", uname: "施凱倫", utitle: "醫師", session_token: "8a7db3bcca8bed08182c8e6c895dad6a9b1786c1"},
  {worksense_id: nil, uid: "111252", upw: "111252", uname: "蘇培元", utitle: "醫師", session_token: "1942b72bdb71d1ac6181be975edfd31bf07f0520"},
  {worksense_id: nil, uid: "144315", upw: "144315", uname: "林彥至", utitle: "醫師", session_token: "e476c310deee4bd1b96f1f74d15d3cac9032d838"},
  {worksense_id: nil, uid: "149054", upw: "149054", uname: "楊承達", utitle: "醫師", session_token: "94869161fe085e7c6ac74f5e36dcae00b8fa40eb"},
  {worksense_id: nil, uid: "151670", upw: "151670", uname: "林成行", utitle: "醫師", session_token: "14043c3b9066ca5b0b499ebe78a60433f851894c"},
  {worksense_id: nil, uid: "157083", upw: "157083", uname: "劉彥均", utitle: "醫師", session_token: "1d91d32a09de7b77fd8cc5a2d415d816700023a7"},
  {worksense_id: nil, uid: "159648", upw: "159648", uname: "趙令瑞", utitle: "醫師", session_token: "b8c4f186d2f2690afe82dc3e9277dc9273f48ef0"},
  {worksense_id: nil, uid: "155743", upw: "155743", uname: "劉立揚", utitle: "醫師", session_token: "5e46bb439be39ec876c134e564451fed08681816"},
  {worksense_id: nil, uid: "180358", upw: "180358", uname: "許柏格", utitle: "醫師", session_token: "3a97a135fd7eee35256239cbc89b60fc5775d771"},
  {worksense_id: nil, uid: "4849", upw: "4849", uname: "黃燈明", utitle: "醫師", session_token: "66e3f657620c1dfdd0274faf301708df1074aab8"},
  {worksense_id: nil, uid: "107431", upw: "107431", uname: "黃玄遠", utitle: "醫師", session_token: "ff3b4141e682c0bace3b9e7620f2520bb22407dc"},
  {worksense_id: nil, uid: "117190", upw: "117190", uname: "陳志誠", utitle: "醫師", session_token: "cc1763653dfd08fdd3cb2deaa6be4f209eee9542"},
  {worksense_id: nil, uid: "177176", upw: "177176", uname: "張譽耀", utitle: "醫師", session_token: "01030700168be8c9e5073e0b2ec482933e1b7163"},
  {worksense_id: nil, uid: "361428", upw: "361428", uname: "王愷晟", utitle: "醫師", session_token: "68c8122b15e5ff5149719e8f3a20485ca5244718"},
  {worksense_id: nil, uid: "361548", upw: "361548", uname: "林耿億", utitle: "醫師", session_token: "28f80af07224a18d8fb7a22e6701426c92d8b9c3"},
  {worksense_id: nil, uid: "6484", upw: "6484", uname: "陳淑慧", utitle: "護理師", session_token: "70c7c9e5f583f5a0036c4910527dcd20d54abc16"},
  {worksense_id: nil, uid: "40636", upw: "40636", uname: "曾慧禎", utitle: "護理師", session_token: "6a46e84fd18e834bebb9dfa10474ab89de871734"},
  {worksense_id: nil, uid: "71116", upw: "71116", uname: "蔡華媖", utitle: "護理師", session_token: "c4da54e65e43a1af24d52166adb96db234031550"},
  {worksense_id: nil, uid: "108095", upw: "108095", uname: "張莉苓", utitle: "護理師", session_token: "7038023c703e120679c4ad16d52039335b20f3ea"},
  {worksense_id: nil, uid: "54544", upw: "54544", uname: "鄭秀如", utitle: "護理師", session_token: "6c400a54831d56a3d457e71595c1c224c3f7118c"},
  {worksense_id: nil, uid: "67068", upw: "67068", uname: "黃昱宸", utitle: "護理師", session_token: "3dd9084dd9bb92db0a04b6a4049d054a14b0d613"},
  {worksense_id: nil, uid: "84156", upw: "84156", uname: "楊芳琦", utitle: "護理師", session_token: "46d6922fb37743f0763bccaf39bf50f2277727a6"},
  {worksense_id: nil, uid: "90658", upw: "90658", uname: "陳玉珊", utitle: "護理師", session_token: "3193d69250d6bee0f022bec1bc11c0fc6e416b6e"},
  {worksense_id: nil, uid: "71659", upw: "71659", uname: "林美娟", utitle: "護理師", session_token: "7afa8ace6e024f6795de01749e0cad49b81d7eff"},
  {worksense_id: nil, uid: "73920", upw: "73920", uname: "周正彬", utitle: "護理師", session_token: "dd9e463e61047c529ec6adb0612de7b665f5ce3c"},
  {worksense_id: nil, uid: "178478", upw: "178478", uname: "黃惠君", utitle: "護理師", session_token: "ca8af8c42e8b70c35442bae272a924a5ae1180c1"},
  {worksense_id: nil, uid: "136557", upw: "136557", uname: "葉湘莛", utitle: "護理師", session_token: "a0cd418c023bb03ba67509c89c7621c92202ff3d"},
  {worksense_id: nil, uid: "154943", upw: "154943", uname: "李映婕", utitle: "護理師", session_token: "0f905ae29b7f62ef1b57c07b5bfe7a447a84f2e4"},
  {worksense_id: nil, uid: "115682", upw: "115682", uname: "黃怡雯", utitle: "護理師", session_token: "1b7aef07da29740999295ed878b98348d21eee2c"},
  {worksense_id: nil, uid: "167885", upw: "167885", uname: "林芸安", utitle: "護理師", session_token: "70c1b0914bb834a8207f5891c5c52d68194372a6"},
  {worksense_id: nil, uid: "180792", upw: "180792", uname: "林芊粢", utitle: "護理師", session_token: "7c39a75b7b845be402f1420f8921900f9151796c"},
  {worksense_id: nil, uid: "115175", upw: "115175", uname: "周玉華", utitle: "護理師", session_token: "c018542bf9bff9de2f5a5c8acecf6a472a60cd83"}
])


Scopy.create!([
  {worksense_id: nil, rid: "", pid: "", cid: "2557693", mid: "GIF-H260", sid: "1", slabel: "O", sname: "O胃鏡1號", sclass: "胃鏡", status: "在架上"},
  {worksense_id: nil, rid: "", pid: "", cid: "2557705", mid: "GIF-H260", sid: "2", slabel: "O", sname: "O胃鏡2號", sclass: "胃鏡", status: "在架上"},
  {worksense_id: nil, rid: "", pid: "", cid: "2557706", mid: "GIF-H260", sid: "3", slabel: "O", sname: "O胃鏡3號", sclass: "胃鏡", status: "在架上"},
  {worksense_id: nil, rid: "", pid: "", cid: "2557710", mid: "GIF-H260", sid: "4", slabel: "O", sname: "O胃鏡4號", sclass: "胃鏡", status: "在架上"},
  {worksense_id: nil, rid: "", pid: "", cid: "2557712", mid: "GIF-H260", sid: "5", slabel: "O", sname: "O胃鏡5號", sclass: "胃鏡", status: "在架上"},
  {worksense_id: nil, rid: "", pid: "022192", cid: "3G246A355", mid: "EG-590WR", sid: "7", slabel: "F", sname: "O胃鏡7號", sclass: "胃鏡", status: "在架上"},
  {worksense_id: nil, rid: "06145044", pid: "022188", cid: "3G246A473", mid: "EG-590WR", sid: "9", slabel: "F", sname: "O胃鏡9號", sclass: "胃鏡", status: "在架上"},
  {worksense_id: nil, rid: "05708180", pid: "022189", cid: "3G246A477", mid: "EG-590WR", sid: "10", slabel: "F", sname: "O胃鏡10號", sclass: "胃鏡", status: "在架上"},
  {worksense_id: nil, rid: "", pid: "026883", cid: "2049816", mid: "GIF-H260", sid: "13", slabel: "O", sname: "O胃鏡13號", sclass: "胃鏡", status: "在架上"},
  {worksense_id: nil, rid: "", pid: "026884", cid: "2049762", mid: "GIF-H260", sid: "14", slabel: "O", sname: "O胃鏡14號", sclass: "胃鏡", status: "在架上"},
  {worksense_id: nil, rid: "", pid: "026885", cid: "2049723", mid: "GIF-H260", sid: "15", slabel: "O", sname: "O胃鏡15號", sclass: "胃鏡", status: "在架上"},
  {worksense_id: nil, rid: "", pid: "026886", cid: "2040005", mid: "GIF-H260", sid: "16", slabel: "O", sname: "O胃鏡16號", sclass: "胃鏡", status: "在架上"},
  {worksense_id: nil, rid: "", pid: "026887", cid: "2049995", mid: "GIF-H260", sid: "17", slabel: "O", sname: "O胃鏡17號", sclass: "胃鏡", status: "在架上"},
  {worksense_id: nil, rid: "", pid: "028478", cid: "9G246A366", mid: "EG590WR", sid: "18", slabel: "F", sname: "F胃鏡18號", sclass: "胃鏡", status: "在架上"},
  {worksense_id: nil, rid: "", pid: "028479", cid: "9G246A370", mid: "EG590WR", sid: "19", slabel: "F", sname: "F胃鏡19號", sclass: "胃鏡", status: "在架上"},
  {worksense_id: nil, rid: "05123924", pid: "028480", cid: "9G246A375", mid: "EG590WR", sid: "20", slabel: "F", sname: "F胃鏡20號", sclass: "胃鏡", status: "在架上"},
  {worksense_id: nil, rid: "", pid: "030439", cid: "2251340", mid: "GIF-Q260", sid: "21", slabel: "O", sname: "O胃鏡21號", sclass: "胃鏡", status: "在架上"},
  {worksense_id: nil, rid: "", pid: "030440", cid: "2251341", mid: "GIF-Q260", sid: "22", slabel: "O", sname: "O胃鏡22號", sclass: "胃鏡", status: "在架上"},
  {worksense_id: nil, rid: "", pid: "022212", cid: "3G247A098", mid: "EG-590ZW", sid: "25", slabel: "F", sname: "F胃鏡25號(放大型)", sclass: "胃鏡", status: "在架上"},
  {worksense_id: nil, rid: "", pid: "026888", cid: "2040005", mid: "GIF2TQ260M", sid: "26", slabel: "O", sname: "O雙腔內視鏡26號", sclass: "雙腔內視鏡", status: "在架上"},
  {worksense_id: nil, rid: "", pid: "", cid: "2503777", mid: "GIF-XP260N", sid: "27", slabel: "O", sname: "O鼻鏡27號", sclass: "鼻鏡", status: "在架上"},
  {worksense_id: nil, rid: "", pid: "022213", cid: "4G250A066", mid: "EG-530N", sid: "28", slabel: "F", sname: "F鼻鏡28號", sclass: "鼻鏡", status: "在架上"},
  {worksense_id: nil, rid: "", pid: "022442", cid: "6G250A159", mid: "EG-530N", sid: "29", slabel: "F", sname: "F鼻鏡29號", sclass: "鼻鏡", status: "在架上"},
  {worksense_id: nil, rid: "", pid: "030441", cid: "2113052", mid: "GIF-H260Z", sid: "30", slabel: "O", sname: "O胃鏡30號(放大型)", sclass: "胃鏡", status: "在架上"},
  {worksense_id: nil, rid: "", pid: "030443", cid: "2210638", mid: "PCF-Q260JI", sid: "31", slabel: "O", sname: "O大腸鏡31號(130CM)", sclass: "大腸鏡", status: "在架上"},
  {worksense_id: nil, rid: "", pid: "031319", cid: "2302063", mid: "GIF-Q260AZI", sid: "32", slabel: "O", sname: "O大腸鏡32號(130CM放大型)", sclass: "大腸鏡", status: "在架上"},
  {worksense_id: nil, rid: "", pid: "020116", cid: "3C361A092", mid: "EN-450T5", sid: "33", slabel: "F", sname: "F小腸鏡33號", sclass: "小腸鏡", status: "在架上"},
  {worksense_id: nil, rid: "", pid: "034567", cid: "1410640", mid: "GF-UCT260", sid: "86", slabel: "O", sname: "O內視超音波86號", sclass: "內視超音波", status: "在架上"},
  {worksense_id: nil, rid: "", pid: "019799", cid: "E110122", mid: "ED-3230K", sid: "92", slabel: "P", sname: "P膽道鏡92號(小)", sclass: "膽道鏡", status: "在架上"},
  {worksense_id: nil, rid: "", pid: "025931", cid: "2000950", mid: "TJF-260", sid: "93", slabel: "O", sname: "O膽道鏡93號", sclass: "膽道鏡", status: "在架上"},
  {worksense_id: nil, rid: "", pid: "025930", cid: "2900998", mid: "TJF-260", sid: "94", slabel: "O", sname: "O膽道鏡94號", sclass: "膽道鏡", status: "在架上"},
  {worksense_id: nil, rid: "", pid: "025929", cid: "2901010", mid: "TJF-260", sid: "95", slabel: "O", sname: "O膽道鏡95號", sclass: "膽道鏡", status: "在架上"},
  {worksense_id: nil, rid: "", pid: "032877", cid: "2402376", mid: "TJF-260", sid: "96", slabel: "O", sname: "O膽道鏡96號", sclass: "膽道鏡", status: "在架上"},
  {worksense_id: nil, rid: "", pid: "025928", cid: "2912172", mid: "JF-260", sid: "97", slabel: "O", sname: "O膽道鏡97號(小)", sclass: "膽道鏡", status: "在架上"},
  {worksense_id: nil, rid: "", pid: "032878", cid: "2402377", mid: "TJF-260", sid: "98", slabel: "O", sname: "O膽道鏡98號", sclass: "膽道鏡", status: "在架上"},
  {worksense_id: nil, rid: "", pid: "", cid: "2506102", mid: "CF-H260AI", sid: "37", slabel: "O", sname: "O大腸鏡37號(130CM)", sclass: "大腸鏡", status: "在架上"},
  {worksense_id: nil, rid: "", pid: "", cid: "2506104", mid: "CF-H260AI", sid: "38", slabel: "O", sname: "O大腸鏡38號(130CM)", sclass: "大腸鏡", status: "在架上"},
  {worksense_id: nil, rid: "", pid: "", cid: "2506105", mid: "CF-H260AI", sid: "39", slabel: "O", sname: "O大腸鏡39號(130CM)", sclass: "大腸鏡", status: "在架上"},
  {worksense_id: nil, rid: "", pid: "026914", cid: "2001183", mid: "CF-H260AL", sid: "40", slabel: "O", sname: "O大腸鏡40號", sclass: "大腸鏡", status: "在架上"},
  {worksense_id: nil, rid: "", pid: "026915", cid: "2001737", mid: "CF-H260AL", sid: "41", slabel: "O", sname: "O大腸鏡41號", sclass: "大腸鏡", status: "在架上"},
  {worksense_id: nil, rid: "", pid: "022196", cid: "4C340A011", mid: "EC-450WL5", sid: "42", slabel: "F", sname: "F大腸鏡42號", sclass: "大腸鏡", status: "在架上"},
  {worksense_id: nil, rid: "", pid: "022215", cid: "4C340A015", mid: "EC-450WL5", sid: "43", slabel: "F", sname: "F大腸鏡43號", sclass: "大腸鏡", status: "在架上"},
  {worksense_id: nil, rid: "", pid: "022194", cid: "4C340A020", mid: "EC-450WL5", sid: "44", slabel: "F", sname: "F大腸鏡44號", sclass: "大腸鏡", status: "在架上"},
  {worksense_id: nil, rid: "", pid: "022195", cid: "4C340A022", mid: "EC-450WL5", sid: "45", slabel: "F", sname: "F大腸鏡45號", sclass: "大腸鏡", status: "在架上"},
  {worksense_id: nil, rid: "", pid: "022448", cid: "4C340A058", mid: "EC-450WL5", sid: "47", slabel: "F", sname: "F大腸鏡47號", sclass: "大腸鏡", status: "在架上"},
  {worksense_id: nil, rid: "", pid: "023354", cid: "4C340A060", mid: "EC-450WL5", sid: "48", slabel: "F", sname: "F大腸鏡48號", sclass: "大腸鏡", status: "在架上"},
  {worksense_id: nil, rid: "", pid: "031320", cid: "2301860", mid: "CF-H260AL", sid: "49", slabel: "O", sname: "O大腸鏡49號", sclass: "大腸鏡", status: "在架上"},
  {worksense_id: nil, rid: "", pid: "022214", cid: "5C363A076", mid: "EC-590ZWL", sid: "60", slabel: "F", sname: "F大腸鏡(放大型)60號", sclass: "大腸鏡", status: "在架上"},
  {worksense_id: nil, rid: "", pid: "022453", cid: "4C342A055", mid: "EC-450MP5", sid: "111", slabel: "F", sname: "F小兒大腸鏡111號", sclass: "大腸鏡", status: "在架上"},
  {worksense_id: nil, rid: "", pid: "022451", cid: "3C306A285", mid: "EC450WM5", sid: "707", slabel: "F", sname: "F大腸鏡707號(120CM)", sclass: "大腸鏡", status: "在架上"},
  {worksense_id: nil, rid: "", pid: "022452", cid: "3C306A293", mid: "EC450WM5", sid: "708", slabel: "F", sname: "F大腸鏡708號(120CM)", sclass: "大腸鏡", status: "在架上"},
  {worksense_id: nil, rid: "", pid: "028477", cid: "340A008", mid: "EC450WL5", sid: "710", slabel: "F", sname: "F大腸鏡710號", sclass: "大腸鏡", status: "在架上"},
  {worksense_id: nil, rid: "", pid: "028475", cid: "340A010", mid: "EC450WL5", sid: "711", slabel: "F", sname: "F大腸鏡711號", sclass: "大腸鏡", status: "在架上"},
  {worksense_id: nil, rid: "", pid: "028476", cid: "340A012", mid: "EC450WL5", sid: "712", slabel: "F", sname: "F大腸鏡712號", sclass: "大腸鏡", status: "在架上"}
])


Site.create!([
  {worksense_id: nil, sname: "鏡架上"},
  {worksense_id: nil, sname: "Room1"},
  {worksense_id: nil, sname: "Room2"},
  {worksense_id: nil, sname: "Room3"},
  {worksense_id: nil, sname: "Room4"},
  {worksense_id: nil, sname: "洗滌台"},
  {worksense_id: nil, sname: "洗滌機"}
])


Patient.create!([
  {worksense_id: nil, pid: "23855017", pname: "莊三元", birthday: "1929-05-01", sex: "M", telephone: "048903033", address: "526彰化縣二林鎮東華里7鄰路西巷5號"},
  {worksense_id: nil, pid: "2506059", pname: "莊壽美", birthday: "1952-03-02", sex: "F", telephone: "047117263", address: "500彰化縣彰化市成功里仁愛東街61巷3號"}
])


Examine.create!([
  {worksense_id: nil, seq: "38033314", eseq: "45115812", typeid: "CL", typename: "大腸鏡", source: "住院", stat: 5, statname: "完成", chargdate: "2016-06-23", chargtime: "2000-01-01 11:20:42", logindate: "2016-06-23", logintime: "2000-01-01 11:26:29", orderdr: "77149", orderdrname: "徐友春", studydr: "77149", studydrname: "徐友春", enterdr: "77149", enterdrname: "徐友春", orderdate: "2016-06-23", ordertime: "2000-01-01 11:20:42", completedate: "2016-06-23", completetime: "2000-01-01 11:29:29", enterdate: "2016-06-23", entertime: "2000-01-01 11:29:29", report: "047 F-大腸鏡(47) 型號:EC-450WL5 財產編號:22448  檢查開始時間   : 11:02:32 檢查最深入時間 : 11:11:22 檢查結束時間   : 11:15:09  #1.Indication    See request sheet #2.Pain Score:     Pre-procedure : 0/10    Post-procedure: 0/10 #3.大腸鏡伸入位置(Insertion level)最深位置:    Cecum  #4.檢查前用藥 (Premedication):    止痙攣用藥 :無     止痛鎮靜用藥 :無  #5.清腸用藥 (Colon cleansing agent):    PEG-ELS類  #6.清腸給藥時間 (Prepartion time):    Spilt dose  #7.清腸程度 (Colon cleansing level):    不良 (Poor)  #8.大腸鏡檢後併發症(Complication):     Nil  #9.抗凝血藥物 (Anti platelet/Cogaulant):     無 #10.Finding    1      診斷 發炎/潰瘍;      位置 Transverse colon;Splenic flexure;Descending colon;Sigmoid colon;Rectum;      處置 S/p biopsy;      描述 several shallow ulceration from rectum to T-colon , s/p random BX, 2 piece    2      診斷 其他異常;Colonic diverticulosis;      位置 Sigmoid colon;    3      診斷 痔瘡;Mixed hemorrhoids;      描述 moderate #11.診斷     1 : 發炎/潰瘍;位置:Transverse colon;Splenic flexure;Descending colon;Sigmoid colon;Rectum;處置:S/p biopsy;     2 : 其他異常;Colonic diverticulosis;位置:Sigmoid colon;     3 : 痔瘡;Mixed hemorrhoids; #12.Immediate Postprocedure Needs:     1. Explain findings to patient and family     2. Arrange outpatient clinic follow-up     大腸鏡檢查日期: 2016-06-23", pacsno: "K380333140101"},
  {worksense_id: nil, seq: "38033580", eseq: "45116250", typeid: "CL", typename: "大腸鏡", source: "門診", stat: 5, statname: "完成", chargdate: "2016-06-23", chargtime: "2000-01-01 11:50:22", logindate: "2016-06-23", logintime: "2000-01-01 11:56:57", orderdr: "394", orderdrname: "林國川", studydr: "394", studydrname: "林國川", enterdr: "151670", enterdrname: "林成行", orderdate: "2016-06-23", ordertime: "2000-01-01 11:50:22", completedate: "2016-06-23", completetime: "2000-01-01 11:56:57", enterdate: "2016-06-23", entertime: "2000-01-01 11:56:57", report: "039 O-大腸鏡(39) 型號:CF-H260AL 財產編號:  040 O-大腸鏡(40) 型號:CF-H260AL 財產編號:26914  檢查開始時間   : 11:04:59 檢查最深入時間 : 11:36:40 檢查結束時間   : 11:51:16  #1.Indication    See request sheet #2.Pain Score:     Pre-procedure : 0/10    Post-procedure: 0/10 #3.大腸鏡伸入位置(Insertion level)最深位置:    Cecum  #4.檢查前用藥 (Premedication):    止痙攣用藥 :有     止痛鎮靜用藥 :有 Midazolam (Dormicum) Meperidine (Demerol)  #5.清腸用藥 (Colon cleansing agent):    PEG-ELS類  #6.清腸給藥時間 (Prepartion time):    Morning single dose  #7.清腸程度 (Colon cleansing level):    尚可 (Fair)  #8.大腸鏡檢後併發症(Complication):     Nil  #9.抗凝血藥物 (Anti platelet/Cogaulant): #10.Finding    1      診斷 瘜肉;增生性瘜肉;Hyperplastic polyp;      位置 Sigmoid colon;      處置 S/p biopsy;S/p EMR;      檢體個數 1顆      病變個數 1顆      大小 0.5 公分 (內視鏡下大小)      編號 A      描述 a paris classification 0-IIa lesion about 0.7cm in size over sigmoid colon about 35cm from anal verge s/p biopsy 3 pieces , followed with polypoid changed 0-Ip thus  shift to s/p EMR polypectomy #11.診斷     1 : 瘜肉;增生性瘜肉;Hyperplastic polyp;位置:Sigmoid colon;0.5公分(內視鏡下大小);處置:S/p biopsy;S/p EMR; #12.Immediate Postprocedure Needs:     1. Explain findings to patient and family     2. Arrange outpatient clinic follow-up     大腸鏡檢查日期: 2016-06-23", pacsno: "K380335800101"}
])


Worksense.create!([
  {user_id: 26, scopy_id: 1, patient_id: 1, examine_id: 1, site_id: 5, begindate: "2016-06-23", begintime: "2000-01-01 11:02:32", enddate: "2016-06-23", endtime: "2000-01-01 12:15:09"},
  {user_id: 31, scopy_id: 2, patient_id: 2, examine_id: 2, site_id: 5, begindate: "2016-06-23", begintime: "2000-01-01 11:04:59", enddate: "2016-06-23", endtime: "2000-01-01 11:51:16"},
  {user_id: 37, scopy_id: 1, patient_id: 1, examine_id: 1, site_id: 6, begindate: "2016-06-23", begintime: "2000-01-01 12:30:13", enddate: "2016-06-23", endtime: "2000-01-01 13:00:13"},
  {user_id: 37, scopy_id: 1, patient_id: 1, examine_id: 1, site_id: 7, begindate: "2016-06-23", begintime: "2000-01-01 13:12:50", enddate: "2016-06-23", endtime: "2000-01-01 14:12:50"}
])
