/// 语言枚举
enum AppLanguage { zh, ko }

/// 翻译集
class TranslationSet {
  // ── 通用 ──
  final String appTitle;
  final String heroTitle;
  final String heroSubtitle;
  final String heroTagline;
  final String heroStatCapital;
  final String heroStatHistory;
  final String heroStatPopulation;
  final String heroCityDesc;

  // ── 地区介绍 ──
  final String areaTitle;
  final String areaSubtitle;
  final String areaHighlight;
  final String advantageSubway;
  final String advantageSubwayDesc;
  final String advantageSubwayDetail;
  final String advantageMedical;
  final String advantageMedicalDesc;
  final String advantageMedicalDetail;
  final String advantageEducation;
  final String advantageEducationDesc;
  final String advantageEducationDetail;
  final String advantagePayment;
  final String advantagePaymentDesc;
  final String advantagePaymentDetail;
  final String advantageCulture;
  final String advantageCultureDesc;
  final String advantageCultureDetail;
  final String gotIt;

  // ── 景点 ──
  final String attractionsTitle;
  final String attractionsSubtitle;
  final String address;
  final String time;
  final String forbiddenCityDesc;
  final String forbiddenCityHighlight;
  final String greatWallDesc;
  final String greatWallHighlight;
  final String templeHeavenDesc;
  final String templeHeavenHighlight;
  final String shougangDesc;
  final String shougangHighlight;
  final String universalDesc;
  final String universalHighlight;
  final String guomaoDesc;
  final String guomaoHighlight;

  // ── 美食 ──
  final String foodTitle;
  final String foodSubtitle;
  final String roastDuckDesc;
  final String noodleDesc;
  final String hotpotDesc;
  final String skewerDesc;
  final String stirFryDesc;
  final String snackDesc;

  // ── 旅行攻略 ──
  final String travelTitle;
  final String travelSubtitle;
  final String step1Title;
  final String step1Desc;
  final String step1Tip;
  final String step2Title;
  final String step2Desc;
  final String step2Tip;
  final String step3Title;
  final String step3Desc;
  final String step3Tip;
  final String step4Title;
  final String step4Desc;
  final String step4Tip;
  final String step5Title;
  final String step5Desc;
  final String step5Tip;
  final String step6Title;
  final String step6Desc;
  final String step6Tip;

  // ── 路线 ──
  final String routeTitle;
  final String routeSubtitle;
  final String day1Title;
  final String day2Title;
  final String day3Title;
  final List<String> day1Route;
  final List<String> day2Route;
  final List<String> day3Route;

  // ── 页脚 ──
  final String footerTitle;
  final String footerSubtitle;

  // ── 底部导航 ──
  final String navArea;
  final String navAttractions;
  final String navFood;
  final String navTravel;
  final String navAiUsage;

  // ── AI 技术应用 ──
  final String aiUsageTitle;
  final String aiUsageSubtitle;
  final String aiUsageIntro;
  final String aiFeature1Title;
  final String aiFeature1Desc;
  final String aiFeature1Tech;
  final String aiFeature2Title;
  final String aiFeature2Desc;
  final String aiFeature2Tech;
  final String aiFeature3Title;
  final String aiFeature3Desc;
  final String aiFeature3Tech;
  final String aiUsageProvider;
  final String aiUsageModel;
  final String aiUsageNote;

  // ── 景点名 ──
  final String forbiddenCity;
  final String greatWall;
  final String templeHeaven;
  final String shougang;
  final String universal;
  final String guomao;

  // ── 美食名和分类 ──
  final String roastDuck;
  final String roastDuckCat;
  final String noodle;
  final String noodleCat;
  final String hotpot;
  final String hotpotCat;
  final String skewer;
  final String skewerCat;
  final String stirFry;
  final String stirFryCat;
  final String snack;
  final String snackCat;

  // ── 景点位置和门票 ──
  final String fcLocation;
  final String fcTicket;
  final String fcTime;
  final String gwLocation;
  final String gwTicket;
  final String gwTime;
  final String thLocation;
  final String thTicket;
  final String thTime;
  final String sgLocation;
  final String sgTicket;
  final String sgTime;
  final String usLocation;
  final String usTicket;
  final String usTime;
  final String gmLocation;
  final String gmTicket;
  final String gmTime;

  // ── 价格 ──
  final String priceRoastDuck;
  final String priceNoodle;
  final String priceHotpot;
  final String priceSkewer;
  final String priceStirFry;
  final String priceSnack;

  const TranslationSet({
    required this.appTitle,
    required this.heroTitle,
    required this.heroSubtitle,
    required this.heroTagline,
    required this.heroStatCapital,
    required this.heroStatHistory,
    required this.heroStatPopulation,
    required this.heroCityDesc,
    required this.areaTitle,
    required this.areaSubtitle,
    required this.areaHighlight,
    required this.advantageSubway,
    required this.advantageSubwayDesc,
    required this.advantageSubwayDetail,
    required this.advantageMedical,
    required this.advantageMedicalDesc,
    required this.advantageMedicalDetail,
    required this.advantageEducation,
    required this.advantageEducationDesc,
    required this.advantageEducationDetail,
    required this.advantagePayment,
    required this.advantagePaymentDesc,
    required this.advantagePaymentDetail,
    required this.advantageCulture,
    required this.advantageCultureDesc,
    required this.advantageCultureDetail,
    required this.gotIt,
    required this.attractionsTitle,
    required this.attractionsSubtitle,
    required this.address,
    required this.time,
    required this.forbiddenCityDesc,
    required this.forbiddenCityHighlight,
    required this.greatWallDesc,
    required this.greatWallHighlight,
    required this.templeHeavenDesc,
    required this.templeHeavenHighlight,
    required this.shougangDesc,
    required this.shougangHighlight,
    required this.universalDesc,
    required this.universalHighlight,
    required this.guomaoDesc,
    required this.guomaoHighlight,
    required this.foodTitle,
    required this.foodSubtitle,
    required this.roastDuckDesc,
    required this.noodleDesc,
    required this.hotpotDesc,
    required this.skewerDesc,
    required this.stirFryDesc,
    required this.snackDesc,
    required this.travelTitle,
    required this.travelSubtitle,
    required this.step1Title,
    required this.step1Desc,
    required this.step1Tip,
    required this.step2Title,
    required this.step2Desc,
    required this.step2Tip,
    required this.step3Title,
    required this.step3Desc,
    required this.step3Tip,
    required this.step4Title,
    required this.step4Desc,
    required this.step4Tip,
    required this.step5Title,
    required this.step5Desc,
    required this.step5Tip,
    required this.step6Title,
    required this.step6Desc,
    required this.step6Tip,
    required this.routeTitle,
    required this.routeSubtitle,
    required this.day1Title,
    required this.day2Title,
    required this.day3Title,
    required this.day1Route,
    required this.day2Route,
    required this.day3Route,
    required this.footerTitle,
    required this.footerSubtitle,
    required this.navArea,
    required this.navAttractions,
    required this.navFood,
    required this.navTravel,
    required this.navAiUsage,
    required this.aiUsageTitle,
    required this.aiUsageSubtitle,
    required this.aiUsageIntro,
    required this.aiFeature1Title,
    required this.aiFeature1Desc,
    required this.aiFeature1Tech,
    required this.aiFeature2Title,
    required this.aiFeature2Desc,
    required this.aiFeature2Tech,
    required this.aiFeature3Title,
    required this.aiFeature3Desc,
    required this.aiFeature3Tech,
    required this.aiUsageProvider,
    required this.aiUsageModel,
    required this.aiUsageNote,
    required this.forbiddenCity,
    required this.greatWall,
    required this.templeHeaven,
    required this.shougang,
    required this.universal,
    required this.guomao,
    required this.roastDuck,
    required this.roastDuckCat,
    required this.noodle,
    required this.noodleCat,
    required this.hotpot,
    required this.hotpotCat,
    required this.skewer,
    required this.skewerCat,
    required this.stirFry,
    required this.stirFryCat,
    required this.snack,
    required this.snackCat,
    required this.fcLocation,
    required this.fcTicket,
    required this.fcTime,
    required this.gwLocation,
    required this.gwTicket,
    required this.gwTime,
    required this.thLocation,
    required this.thTicket,
    required this.thTime,
    required this.sgLocation,
    required this.sgTicket,
    required this.sgTime,
    required this.usLocation,
    required this.usTicket,
    required this.usTime,
    required this.gmLocation,
    required this.gmTicket,
    required this.gmTime,
    required this.priceRoastDuck,
    required this.priceNoodle,
    required this.priceHotpot,
    required this.priceSkewer,
    required this.priceStirFry,
    required this.priceSnack,
  });
}

/// 中文翻译
const TranslationSet zh = TranslationSet(
  appTitle: '北京 · 我的家乡',
  heroTitle: '北京',
  heroSubtitle: 'BEIJING',
  heroTagline: '千年古都 · 现代之城 · 我的家乡',
  heroStatCapital: '首都',
  heroStatHistory: '年建城史',
  heroStatPopulation: '常住人口',
  heroCityDesc:
      '北京，中华人民共和国的首都，拥有3000多年建城史和800多年建都史。'
      '作为中国的政治、文化、国际交往和科技创新中心，北京融合了古老文明与现代都市的双重魅力。',

  // 地区介绍
  areaTitle: '家乡地区介绍',
  areaSubtitle: 'AREA INTRODUCTION',
  areaHighlight:
      '北京，中华人民共和国的首都，拥有3000多年建城史和800多年建都史。'
      '作为中国的政治、文化、国际交往和科技创新中心，北京融合了古老文明与现代都市的双重魅力。',
  advantageSubway: '发达的地铁交通',
  advantageSubwayDesc: '北京地铁运营里程超800公里，27条线路覆盖全市',
  advantageSubwayDetail:
      '北京地铁日均客流超1000万人次，拥有27条运营线路、475座车站。机场快线25分钟从首都机场直达东直门，大兴机场线19分钟直达草桥。支持扫码乘车（亿通行APP/支付宝），京津冀交通一卡通可畅行三地。',
  advantageMedical: '顶尖医疗资源',
  advantageMedicalDesc: '协和、301、北大医院等三甲医院全国领先',
  advantageMedicalDetail:
      '北京拥有协和医院、中国人民解放军总医院（301医院）、北京大学第一医院、阜外医院等全国顶尖三甲医院60余家，覆盖心血管、肿瘤、神经科等全科室。国际医疗部提供多语言服务，外籍人士就医无忧。',
  advantageEducation: '优质教育资源',
  advantageEducationDesc: '清华、北大等高校云集，教育资源全国第一',
  advantageEducationDetail:
      '北京拥有清华大学、北京大学、中国人民大学等顶尖高校26所，海淀区被誉为"中国硅谷"。中关村科技园区聚集了字节跳动、百度、小米等数千家高科技企业，是中国的科技创新中心。',
  advantagePayment: '便捷的移动支付',
  advantagePaymentDesc: '支付宝、微信支付全覆盖，无需现金出行',
  advantagePaymentDetail:
      '北京已实现全城移动支付覆盖，从路边小摊到高端商场均支持支付宝和微信支付。机场、酒店可办理短期手机SIM卡，下载亿通行APP即可乘坐公交地铁。外籍游客可使用支付宝国际版绑定境外银行卡。',
  advantageCulture: '丰富的文化生活',
  advantageCultureDesc: '798艺术区、国家大剧院、胡同文化精彩纷呈',
  advantageCultureDetail:
      '北京拥有国家大剧院、中国国家博物馆、首都博物馆等世界级文化场馆。798艺术区是亚洲最大的当代艺术区。南锣鼓巷、什刹海等胡同区保留了老北京的生活方式，四合院里的咖啡厅成为新文化地标。',
  gotIt: '知道了',

  // 景点
  attractionsTitle: '代表旅游景点',
  attractionsSubtitle: 'MUST-VISIT ATTRACTIONS',
  address: '地址',
  time: '时间',
  forbiddenCityDesc:
      '明清两代皇家宫殿，始建于1406年，占地72万平方米，有大小宫殿七十多座，房屋九千余间，是世界上现存规模最大、保存最完整的木质结构古建筑群。1987年被列为世界文化遗产。',
  forbiddenCityHighlight: '太和殿 · 乾清宫 · 珍宝馆 · 御花园',
  greatWallDesc:
      '万里长城是中国古代最伟大的防御工程，八达岭段是明长城中保存最完好、最具代表性的一段，海拔1015米，蜿蜒于崇山峻岭之间，气势磅礴。1987年入选世界文化遗产。',
  greatWallHighlight: '好汉坡 · 北八楼 · 缆车观光 · 长城博物馆',
  templeHeavenDesc:
      '明清两代皇帝祭天祈谷的场所，始建于1420年，占地273万平方米，是中国现存最大的古代祭祀性建筑群。祈年殿以独特的木质榫卯结构闻名，回音壁和三音石展现了古代声学奇迹。',
  templeHeavenHighlight: '祈年殿 · 回音壁 · 圜丘坛 · 皇穹宇',
  shougangDesc:
      '百年首钢工厂华丽转身为工业风文化创意园区，冬奥会滑雪大跳台在此举办。巨大的高炉、冷却塔与现代化设计融合，成为北京新晋网红打卡地和城市更新典范。',
  shougangHighlight: '滑雪大跳台 · 三高炉 · 星巴克甄选店 · 空中步道',
  universalDesc:
      '亚洲第三座、全球第五座环球影城主题乐园，2021年开园。拥有哈利波特魔法世界、变形金刚基地、小黄人乐园、侏罗纪世界等七大主题区，是亚洲最大的环球影城。',
  universalHighlight: '哈利波特禁忌之旅 · 霸天虎过山车 · 功夫熊猫区 · 未来水世界',
  guomaoDesc:
      '北京中央商务区，中国最具影响力的商务中心，聚集了众多世界500强企业中国总部。高达528米的中国尊（中信大厦）是北京第一高楼，国贸商城是中国最早的高端商业综合体。',
  guomaoHighlight: '中国尊 · CCTV总部 · 国贸商城 · 世贸天阶',

  // 美食
  foodTitle: '代表美食',
  foodSubtitle: 'BEIJING CUISINE',
  roastDuckDesc: '外皮酥脆、肉质鲜嫩，配以薄饼、甜面酱、葱丝、黄瓜条卷食，是北京最具代表性的美食名片。全聚德、便宜坊、大董为三大流派。',
  noodleDesc: '手擀面上浇以黄酱和甜面酱炒制的肉丁炸酱，配黄瓜丝、豆芽、萝卜丝、黄豆等菜码，是老北京人最家常的味道。',
  hotpotDesc: '铜锅炭火，清汤锅底，手切鲜羊肉薄如纸，蘸芝麻酱、韭菜花、腐乳汁调制的麻酱小料，是北京秋冬最温暖的味觉记忆。',
  skewerDesc: '里脊、鸡排、素串裹上面糊油炸至金黄，撒上孜然和辣椒面，是北京街头巷尾最具烟火气的小吃，放学下班路上的必买零食。',
  stirFryDesc: '以京酱肉丝、宫保鸡丁、焦溜丸子、醋溜木须为代表的京味家常菜，讲究酱香浓郁、咸鲜适口，配一碗米饭就是最地道的北京一餐。',
  snackDesc: '豆汁儿配焦圈、面茶、驴打滚、艾窝窝、豌豆黄、糖耳朵、炒肝、卤煮火烧……每一样都是传承百年的京味儿，护国寺小吃店可一站式品尝。',

  // 旅行攻略
  travelTitle: '旅行攻略指南',
  travelSubtitle: 'TRAVEL GUIDE',
  step1Title: '抵达北京机场',
  step1Desc: '北京有两个国际机场：首都国际机场（PEK）和大兴国际机场（PKX）。首都机场距市中心25公里，大兴机场距市中心46公里。两机场均有清晰的英文指示牌。',
  step1Tip: '💡 首都机场T3航站楼的"紫薇辰恒"景观和T2的"九龙壁"值得一看',
  step2Title: '机场快线进城',
  step2Desc: '首都机场快线25分钟直达东直门（25元），大兴机场线19分钟直达草桥（35元）。在机场到达层即可购票，支持现金、支付宝、微信支付和国际信用卡。',
  step2Tip: '💡 下载"亿通行"APP（英文版Yitongxing），可直接刷码乘车',
  step3Title: '获取本地网络',
  step3Desc: '机场到达大厅可办理中国移动/联通/电信短期SIM卡（7天约100元含流量）。或提前开通国际漫游。机场、商场、地铁均有免费WiFi（需手机号验证）。',
  step3Tip: '💡 建议在机场购买SIM卡，市内小店可能要求身份证实名登记',
  step4Title: '公共交通出行',
  step4Desc: '北京地铁覆盖所有主要景点。下载"亿通行"APP扫码乘车，或购买交通一卡通（押金20元）。起步价3元，最高9元。公交起步1元。地铁运营时间约5:00-23:00。',
  step4Tip: '💡 避开工作日7:30-9:00和17:30-19:00的早晚高峰，地铁会非常拥挤',
  step5Title: '打车与网约车',
  step5Desc: '滴滴出行APP（DiDi）是主要的打车平台，支持英文界面和国际信用卡。出租车起步价13元/3公里，之后每公里2.3元。也可使用高德地图APP直接叫车。',
  step5Tip: '💡 打车时给司机看目的地中文名称或地址，大部分司机不会英语',
  step6Title: '翻译与沟通',
  step6Desc: '下载"有道翻译官"或"百度翻译"APP，支持拍照翻译、语音翻译和对话翻译。大部分景点有英文解说牌，五星级酒店和大型商场工作人员可英语交流。',
  step6Tip: '💡 提前保存景点中文名称和地址到手机备忘录，方便给出租车司机看',

  // 路线
  routeTitle: '推荐三日路线',
  routeSubtitle: 'RECOMMENDED 3-DAY ITINERARY',
  day1Title: 'Day 1：中轴线经典游',
  day2Title: 'Day 2：长城+奥运+工业风',
  day3Title: 'Day 3：现代北京+购物',
  day1Route: [
    '上午：天安门广场 → 故宫（约4小时）',
    '中午：前门大街品尝烤鸭/炸酱面',
    '下午：景山公园俯瞰故宫全景 → 北海公园',
    '晚上：什刹海酒吧街/南锣鼓巷胡同游',
    '交通：全程地铁1号线/8号线，步行即可衔接',
  ],
  day2Route: [
    '上午：八达岭长城（建议7点出发避开人流）',
    '中午：景区周边农家菜',
    '下午：首钢园（冬奥滑雪大跳台+工业遗址）',
    '晚上：三里屯太古里晚餐+夜生活',
    '交通：S2线到八达岭；地铁6号线+11号线到首钢园',
  ],
  day3Route: [
    '上午：天坛公园',
    '中午：牛街清真美食街（老北京小吃）',
    '下午：国贸CBD+中国尊观光 → 798艺术区',
    '晚上：王府井/西单购物 → 簋街夜宵',
    '交通：地铁5号线到天坛；1号线贯穿国贸-王府井',
  ],

  // 页脚
  footerTitle: '北京欢迎你',
  footerSubtitle: 'Beijing Welcomes You · 我的家乡',

  // 底部导航
  navArea: '地区介绍',
  navAttractions: '旅游景点',
  navFood: '代表美食',
  navTravel: '旅行攻略',
  navAiUsage: 'AI技术',

  // AI 技术应用
  aiUsageTitle: 'AI技术应用',
  aiUsageSubtitle: 'AI TECHNOLOGY',
  aiUsageIntro: '本应用集成了多项AI技术，为您提供更智能、更个性化的北京旅行体验。以下是在项目中应用的AI技术说明。',
  aiFeature1Title: 'DeepSeek 智能行程规划',
  aiFeature1Desc: '基于DeepSeek大语言模型，根据您选择的兴趣偏好（历史文化、美食探店、拍照打卡等）和旅行天数，自动生成个性化北京旅行行程攻略，包括每日详细安排、交通提示和预算估算。',
  aiFeature1Tech: 'DeepSeek Chat API',
  aiFeature2Title: 'AI 个性化推荐',
  aiFeature2Desc: '通过自然语言处理技术智能分析您的兴趣标签，精准匹配最适合您的景点、美食和旅行路线，实现千人千面的个性化旅行体验。',
  aiFeature2Tech: 'NLP 自然语言处理',
  aiFeature3Title: 'AI 内容生成',
  aiFeature3Desc: 'AI自动生成结构清晰、实用性强的旅行内容，包括详细的每日行程安排、具体的地铁交通提示和大致的预算估算，让您的旅行规划更加轻松高效。',
  aiFeature3Tech: 'LLM 文本生成',
  aiUsageProvider: 'AI服务商',
  aiUsageModel: '使用模型',
  aiUsageNote: '说明：AI功能需要配置DeepSeek API Key才能使用。您可以在DeepSeek平台免费注册获取API Key，通过 --dart-define=DEEPSEEK_KEY=sk-xxxx 方式传入。',

  // 景点名
  forbiddenCity: '故宫',
  greatWall: '长城（八达岭）',
  templeHeaven: '天坛',
  shougang: '首钢园',
  universal: '环球影城',
  guomao: '国贸CBD',

  // 美食名和分类
  roastDuck: '北京烤鸭',
  roastDuckCat: '招牌名菜',
  noodle: '炸酱面',
  noodleCat: '传统面食',
  hotpot: '老北京涮羊肉',
  hotpotCat: '火锅',
  skewer: '炸串',
  skewerCat: '街头小吃',
  stirFry: '京味炒菜',
  stirFryCat: '家常菜',
  snack: '老北京小吃',
  snackCat: '传统小吃',

  // 景点位置和门票
  fcLocation: '北京市东城区景山前街4号',
  fcTicket: '旺季60元 / 淡季40元',
  fcTime: '8:30-17:00（周一闭馆）',
  gwLocation: '北京市延庆区G6京藏高速58号出口',
  gwTicket: '旺季40元 / 淡季35元',
  gwTime: '6:30-19:00（旺季）',
  thLocation: '北京市东城区天坛内东里7号',
  thTicket: '旺季15元 / 淡季10元',
  thTime: '6:00-22:00',
  sgLocation: '北京市石景山区石景山路68号',
  sgTicket: '免费（部分场馆收费）',
  sgTime: '全天开放',
  usLocation: '北京市通州区梨园镇',
  usTicket: '淡季418元起 / 旺季638元起',
  usTime: '9:00-21:00',
  gmLocation: '北京市朝阳区建国门外大街',
  gmTicket: '免费参观（中国尊需预约）',
  gmTime: '全天（商圈）',

  // 价格
  priceRoastDuck: '人均150-400元',
  priceNoodle: '人均20-40元',
  priceHotpot: '人均100-200元',
  priceSkewer: '人均15-30元',
  priceStirFry: '人均50-100元',
  priceSnack: '人均10-30元',
);

/// 韩文翻译
const TranslationSet ko = TranslationSet(
  appTitle: '북경 · 나의 고향',
  heroTitle: '북경',
  heroSubtitle: 'BEIJING',
  heroTagline: '천년 고도 · 현대 도시 · 나의 고향',
  heroStatCapital: '수도',
  heroStatHistory: '년 역사',
  heroStatPopulation: '인구',
  heroCityDesc:
      '베이징은 중화인민공화국의 수도로서 3000년 이상의 도시 역사와 800년 이상의 수도 역사를 가지고 있습니다. '
      '중국의 정치, 문화, 국제 교류 및 과학 기술 혁신의 중심지로서 베이징은 고대 문명과 현대 도시의 이중 매력을 융합하고 있습니다.',

  // 지역 소개
  areaTitle: '고향 지역 소개',
  areaSubtitle: 'AREA INTRODUCTION',
  areaHighlight:
      '베이징은 중화인민공화국의 수도로서 3000년 이상의 도시 역사와 800년 이상의 수도 역사를 가지고 있습니다. '
      '중국의 정치, 문화, 국제 교류 및 과학 기술 혁신의 중심지로서 베이징은 고대 문명과 현대 도시의 이중 매력을 융합하고 있습니다.',
  advantageSubway: '발달된 지하철 교통',
  advantageSubwayDesc: '베이징 지하철 운영 거리 800km 이상, 27개 노선이 도시 전체를 커버',
  advantageSubwayDetail:
      '베이징 지하철은 일일 평균 1000만 명 이상이 이용하며, 27개 운행 노선과 475개 역을 보유하고 있습니다. 공항 쾌속선은 수도공항에서 둥즈먼까지 25분, 다싱 공항선은 차오차오까지 19분 만에 도착합니다. QR코드 승차(이통싱 APP/알리페이)를 지원하며, 징진지 교통 카드로 세 지역을 자유롭게 이동할 수 있습니다.',
  advantageMedical: '최고 수준의 의료 자원',
  advantageMedicalDesc: '셰허, 301, 베이징대학 병원 등 전국 최고 수준',
  advantageMedicalDetail:
      '베이징에는 셰허 병원, 중국 인민해방군 총병원(301병원), 베이징대학 제1병원, 푸와이 병원 등 전국 최고 수준의 3급 병원이 60여 개 있으며, 심혈관, 종양, 신경과 등 모든 진료과를 커버합니다. 국제 진료부는 다국어 서비스를 제공하여 외국인의 진료도 원활합니다.',
  advantageEducation: '우수한 교육 자원',
  advantageEducationDesc: '칭화대, 베이징대 등 명문 대학이 밀집, 교육 자원 전국 1위',
  advantageEducationDetail:
      '베이징에는 칭화대학교, 베이징대학교, 중국인민대학교 등 최고 수준의 대학 26개가 있으며, 하이뎬구는 "중국의 실리콘밸리"로 불립니다. 중관춘 과학기술단지에는 바이트댄스, 바이두, 샤오미 등 수천 개의 첨단 기술 기업이 모여 있으며, 중국의 과학 기술 혁신 중심지입니다.',
  advantagePayment: '편리한 모바일 결제',
  advantagePaymentDesc: '알리페이, 위챗페이 전역 커버, 현금 없이 여행 가능',
  advantagePaymentDetail:
      '베이징은 전역에서 모바일 결제가 가능하며, 길거리 포장마차부터 고급 백화점까지 알리페이와 위챗페이를 지원합니다. 공항과 호텔에서 단기 SIM 카드를 구매할 수 있으며, 이통싱 APP을 다운로드하면 버스와 지하철을 이용할 수 있습니다. 외국인 관광객은 알리페이 국제판을 사용하여 해외 은행 카드를 연동할 수 있습니다.',
  advantageCulture: '풍부한 문화 생활',
  advantageCultureDesc: '798 예술구, 국가대극원, 후퉁 문화가 다채로움',
  advantageCultureDetail:
      '베이징에는 국가대극원, 중국국가박물관, 수도박물관 등 세계적 수준의 문화 시설이 있습니다. 798 예술구는 아시아 최대의 현대 미술 지구입니다. 난뤄구샹, 스차하이 등의 후퉁 지구는 옛 베이징의 생활 방식을 보존하고 있으며, 쓰허위안 안의 카페는 새로운 문화 랜드마크가 되었습니다.',
  gotIt: '확인',

  // 관광지
  attractionsTitle: '대표 관광 명소',
  attractionsSubtitle: 'MUST-VISIT ATTRACTIONS',
  address: '주소',
  time: '시간',
  forbiddenCityDesc:
      '명·청 두 왕조의 황궁으로 1406년에 건립되었으며, 72만 제곱미터 부지에 70여 개의 크고 작은 궁전과 9,000여 칸의 방이 있습니다. 세계에서 현존하는 가장 크고 가장 잘 보존된 목조 고건축군입니다. 1987년 세계문화유산으로 지정되었습니다.',
  forbiddenCityHighlight: '태화전 · 건청궁 · 진보관 · 어화원',
  greatWallDesc:
      '만리장성은 중국 고대의 가장 위대한 방어 공사로, 바다링 구간은 명나라 장성 중 가장 잘 보존되고 가장 대표적인 구간입니다. 해발 1,015m로 험준한 산봉우리 사이를 구불구불 이어져 있으며, 그 기세가 웅장합니다. 1987년 세계문화유산으로 지정되었습니다.',
  greatWallHighlight: '하오한포 · 북8루 · 케이블카 관광 · 장성 박물관',
  templeHeavenDesc:
      '명·청 두 왕조의 황제가 하늘에 제사하고 풍년을 기원하던 장소로, 1420년에 건립되었으며 273만 제곱미터 부지에 위치해 있습니다. 중국에 현존하는 가장 큰 고대 제사 건축군입니다. 기년전은 독특한 목조 구조로 유명하며, 회음벽과 삼음석은 고대 음향학의 기적을 보여줍니다.',
  templeHeavenHighlight: '기년전 · 회음벽 · 원구단 · 황궁우',
  shougangDesc:
      '100년 역사의 수도강철 공장이 산업풍 문화 창의 단지로 화려하게 변신했습니다. 동계올림픽 스키 점프 경기가 이곳에서 개최되었습니다. 거대한 용광로와 냉각탑이 현대적인 디자인과 융합되어 베이징의 새로운 핫플레이스이자 도시 재생의 모범이 되었습니다.',
  shougangHighlight: '스키 점프대 · 3호 용광로 · 스타벅스 리저브 · 공중 산책로',
  universalDesc:
      '아시아 3번째, 세계 5번째 유니버설 스튜디오 테마파크로 2021년에 개장했습니다. 해리포터 마법 세계, 트랜스포머 기지, 미니언즈 파크, 쥬라기 월드 등 7개 테마 구역이 있으며, 아시아 최대의 유니버설 스튜디오입니다.',
  universalHighlight: '해리포터 금지된 여정 · 디셉티콘 롤러코스터 · 쿵푸팬더 구역 · 워터월드',
  guomaoDesc:
      '베이징 중앙 비즈니스 지구로, 중국에서 가장 영향력 있는 비즈니스 센터이며 많은 세계 500대 기업의 중국 본사가 모여 있습니다. 높이 528m의 중국존(중신 빌딩)은 베이징 최고층 건물이며, 궈마오 상청은 중국 최초의 고급 복합 상업 시설입니다.',
  guomaoHighlight: '중국존 · CCTV 본사 · 궈마오 상청 · 세계무역천가',

  // 음식
  foodTitle: '대표 음식',
  foodSubtitle: 'BEIJING CUISINE',
  roastDuckDesc: '바삭한 껍질과 부드러운 고기, 얇은 전병에 단된장, 파채, 오이를 곁들여 먹는 베이징의 가장 대표적인 미식名片입니다. 취안쥐더, 볜이팡, 다둥이 3대 유파입니다.',
  noodleDesc: '수타면에 된장과 단된장으로 볶은 돼지고기 다진 소스를 얹고, 오이채, 숙주, 무채, 대두 등 다양한 고명을 곁들인, 베이징 사람들의 가장 소박한 맛입니다.',
  hotpotDesc: '구리 냄비에 숯불, 맑은 육수를 기본으로 하고, 손으로 썬 신선한 양고기를 종잇장처럼 얇게 썰어 참깨 소스, 부추 꽃 소금, 발효 두부 소스에 찍어 먹는 베이징 가을겨울의 가장 따뜻한 미각 기억입니다.',
  skewerDesc: '돼지 등심, 치킨 커틀릿, 야채 튀김을 반죽에 묻혀 노릇하게 튀긴 후 쿠민과 고춧가루를 뿌린, 베이징 길거리에서 가장 생활감 넘치는 간식으로, 학교 끝나고 퇴근길에 꼭 사 먹는 군것질입니다.',
  stirFryDesc: '징장러우쓰(된장 돼지고기 채볶음), 궁바오지딩(닭고기 땅콩볶음), 자오류완쯔(돼지고기 완자 튀김), 추류무쉬(계란 목이버섯 볶음) 등으로 대표되는 베이징식 가정 요리로, 진한 장 향과 짭조름한 맛이 일품이며, 밥 한 그릇과 함께하면 가장 정통적인 베이징 식사가 완성됩니다.',
  snackDesc: '더우즈얼(발효 두유)에 자오취안(튀김 빵)을 곁들여, 몐차(기장죽), 뤼다군(찹쌀 경단), 아이워워, 완더우황(완두콩 과자), 탕얼둬, 차오간(돼지 간 볶음), 루주(돼지 내장 조림)…… 하나하나가 100년 전통의 베이징 맛이며, 후궈쓰 소식점에서 한 번에 즐길 수 있습니다.',

  // 여행 가이드
  travelTitle: '여행 가이드',
  travelSubtitle: 'TRAVEL GUIDE',
  step1Title: '베이징 공항 도착',
  step1Desc: '베이징에는 두 개의 국제공항이 있습니다: 수도 국제공항(PEK)과 다싱 국제공항(PKX). 수도공항은 시내에서 25km, 다싱공항은 시내에서 46km 떨어져 있습니다. 두 공항 모두 명확한 영어 안내 표지판이 있습니다.',
  step1Tip: '💡 수도공항 T3 터미널의 "자미신항" 경관과 T2의 "구룡벽"을 감상해보세요',
  step2Title: '공항 쾌속선으로 시내 진입',
  step2Desc: '수도공항 쾌속선은 25분 만에 둥즈먼까지 (25위안), 다싱 공항선은 19분 만에 차오차오까지 (35위안). 공항 도착층에서 티켓 구매 가능, 현금/알리페이/위챗페이/국제 신용카드 모두 사용 가능합니다.',
  step2Tip: '💡 "이통싱" APP (영문판 Yitongxing)을 다운로드하면 바로 QR코드로 승차 가능합니다',
  step3Title: '현지 네트워크 이용',
  step3Desc: '공항 도착 로비에서 차이나모바일/차이나유니콤/차이나텔레콤 단기 SIM 카드를 구매할 수 있습니다 (7일 약 100위안, 데이터 포함). 또는 사전에 국제 로밍을 개통하세요. 공항, 쇼핑몰, 지하철 모두 무료 WiFi가 있습니다 (전화번호 인증 필요).',
  step3Tip: '💡 공항에서 SIM 카드를 구매하는 것을 추천합니다. 시내 상점에서는 신분증 실명 등록이 필요할 수 있습니다',
  step4Title: '대중교통 이용',
  step4Desc: '베이징 지하철은 주요 관광지를 모두 커버합니다. "이통싱" APP을 다운로드하여 QR코드로 승차하거나 교통 카드를 구매하세요 (보증금 20위안). 기본 요금 3위안, 최대 9위안. 버스 기본 요금 1위안. 지하철 운행 시간은 약 5:00-23:00입니다.',
  step4Tip: '💡 평일 7:30-9:00, 17:30-19:00의 러시아워를 피하세요. 지하철이 매우 혼잡합니다',
  step5Title: '택시 및 차량 호출',
  step5Desc: 'DiDi 츄싱 APP (DiDi)이 주요 차량 호출 플랫폼으로, 영어 인터페이스와 국제 신용카드를 지원합니다. 택시 기본 요금 13위안/3km, 이후 km당 2.3위안. 가오더 지도 APP으로도 직접 차량을 호출할 수 있습니다.',
  step5Tip: '💡 택시 기사님께 목적지의 중국어 이름이나 주소를 보여주세요. 대부분의 기사님은 영어를 하지 못합니다',
  step6Title: '번역 및 의사소통',
  step6Desc: '"유다오 번역관" 또는 "바이두 번역" APP을 다운로드하세요. 사진 번역, 음성 번역, 대화 번역을 지원합니다. 대부분의 관광지에는 영어 설명판이 있으며, 5성급 호텔과 대형 쇼핑몰 직원은 영어로 소통 가능합니다.',
  step6Tip: '💡 관광지의 중국어 이름과 주소를 미리 휴대폰 메모에 저장해 두면 택시 기사님께 보여주기 편리합니다',

  // 여행 코스
  routeTitle: '추천 3일 코스',
  routeSubtitle: 'RECOMMENDED 3-DAY ITINERARY',
  day1Title: 'Day 1: 중축선 클래식 투어',
  day2Title: 'Day 2: 만리장성+올림픽+산업풍',
  day3Title: 'Day 3: 현대 베이징+쇼핑',
  day1Route: [
    '오전: 톈안먼 광장 → 자금성 (약 4시간)',
    '점심: 첸먼 거리에서 북경 오리구이/자장몐 맛보기',
    '오후: 징산 공원에서 자금성 파노라마 감상 → 베이하이 공원',
    '저녁: 스차하이 바 거리/난뤄구샹 후퉁 투어',
    '교통: 전 코스 지하철 1호선/8호선, 도보로 연결 가능',
  ],
  day2Route: [
    '오전: 바다링 만리장성 (인파를 피해 7시 출발 권장)',
    '점심: 관광지 주변 농가 요리',
    '오후: 수도강철단지 (동계올림픽 스키 점프대+산업 유적)',
    '저녁: 싼리툰 타이구리에서 저녁 식사+나이트라이프',
    '교통: S2선 바다링행; 지하철 6호선+11호선 수도강철단지행',
  ],
  day3Route: [
    '오전: 천단 공원',
    '점심: 뉴제 할랄 음식 거리 (베이징 전통 간식)',
    '오후: 궈마오 CBD+중국존 전망 → 798 예술구',
    '저녁: 왕푸징/시단 쇼핑 → 구이제 야식',
    '교통: 지하철 5호선 천단행; 1호선 궈마오-왕푸징 연결',
  ],

  // 푸터
  footerTitle: '베이징이 당신을 환영합니다',
  footerSubtitle: 'Beijing Welcomes You · 나의 고향',

  // 하단 네비게이션
  navArea: '지역 소개',
  navAttractions: '관광 명소',
  navFood: '대표 음식',
  navTravel: '여행 가이드',
  navAiUsage: 'AI 기술',

  // AI 기술 활용
  aiUsageTitle: 'AI 기술 활용',
  aiUsageSubtitle: 'AI TECHNOLOGY',
  aiUsageIntro: '본 앱은 다양한 AI 기술을 통합하여 더욱 스마트하고 개인화된 베이징 여행 경험을 제공합니다. 다음은 프로젝트에 적용된 AI 기술에 대한 설명입니다.',
  aiFeature1Title: 'DeepSeek AI 여행 플래너',
  aiFeature1Desc: 'DeepSeek 대형 언어 모델을 기반으로, 선택한 관심사(역사문화, 맛집탐방, 사진명소 등)와 여행 일수에 따라 개인화된 베이징 여행 일정을 자동으로 생성하며, 일별 상세 일정, 교통 팁, 예산 추정을 포함합니다.',
  aiFeature1Tech: 'DeepSeek Chat API',
  aiFeature2Title: 'AI 맞춤 추천',
  aiFeature2Desc: '자연어 처리 기술을 통해 관심 태그를 지능적으로 분석하여, 최적의 관광지, 음식, 여행 경로를 정확하게 매칭하여 개인화된 여행 경험을 제공합니다.',
  aiFeature2Tech: 'NLP 자연어 처리',
  aiFeature3Title: 'AI 콘텐츠 생성',
  aiFeature3Desc: 'AI가 구조화되고 실용적인 여행 콘텐츠를 자동으로 생성합니다. 상세한 일별 일정, 구체적인 지하철 교통 안내, 예산 추정을 포함하여 여행 계획을 더욱 쉽고 효율적으로 만들어 줍니다.',
  aiFeature3Tech: 'LLM 텍스트 생성',
  aiUsageProvider: 'AI 서비스 제공업체',
  aiUsageModel: '사용 모델',
  aiUsageNote: '안내: AI 기능을 사용하려면 DeepSeek API Key 설정이 필요합니다. DeepSeek 플랫폼에서 무료로 API Key를 발급받아 --dart-define=DEEPSEEK_KEY=sk-xxxx 방식으로 전달할 수 있습니다.',

  // 관광지명
  forbiddenCity: '자금성',
  greatWall: '만리장성 (바다링)',
  templeHeaven: '천단',
  shougang: '수도강철단지',
  universal: '유니버설 스튜디오',
  guomao: '궈마오 CBD',

  // 음식명과 분류
  roastDuck: '북경 오리구이',
  roastDuckCat: '대표 요리',
  noodle: '자장몐',
  noodleCat: '전통 면요리',
  hotpot: '베이징식 양고기 샤부샤부',
  hotpotCat: '훠궈',
  skewer: '튀김 꼬치',
  skewerCat: '길거리 간식',
  stirFry: '베이징식 볶음 요리',
  stirFryCat: '가정 요리',
  snack: '베이징 전통 간식',
  snackCat: '전통 간식',

  // 관광지 위치 및 입장권
  fcLocation: '베이징시 둥청구 징산첸제 4호',
  fcTicket: '성수기 60위안 / 비수기 40위안',
  fcTime: '8:30-17:00 (월요일 휴관)',
  gwLocation: '베이징시 옌칭구 G6 징짱 고속도로 58호 출구',
  gwTicket: '성수기 40위안 / 비수기 35위안',
  gwTime: '6:30-19:00 (성수기)',
  thLocation: '베이징시 둥청구 톈탄둥리 7호',
  thTicket: '성수기 15위안 / 비수기 10위안',
  thTime: '6:00-22:00',
  sgLocation: '베이징시 스징산구 스징산로 68호',
  sgTicket: '무료 (일부 시설 유료)',
  sgTime: '종일 개방',
  usLocation: '베이징시 퉁저우구 리위안진',
  usTicket: '비수기 418위안~ / 성수기 638위안~',
  usTime: '9:00-21:00',
  gmLocation: '베이징시 차오양구 젠궈먼와이다제',
  gmTicket: '무료 관람 (중국존 예약 필요)',
  gmTime: '종일 (상업 지구)',

  // 가격
  priceRoastDuck: '1인당 150-400위안',
  priceNoodle: '1인당 20-40위안',
  priceHotpot: '1인당 100-200위안',
  priceSkewer: '1인당 15-30위안',
  priceStirFry: '1인당 50-100위안',
  priceSnack: '1인당 10-30위안',
);
