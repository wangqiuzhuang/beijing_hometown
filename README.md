# 北京 · 我的家乡

> **Flutter 期末作业**
> 姓名：王先生
> 学号：（请填写）
> 日期：2026 年 6 月

---

## 📱 项目概览

一个展示北京家乡信息的 Flutter 单页应用，融合**中韩双语切换**、**多主题配色**、**丰富的多媒体内容**和 **AI 智能行程生成**功能。

| 模块 | 内容 |
|------|------|
| 🏙️ 地区介绍 | 地铁交通、医疗资源、教育、移动支付、文化生活 |
| 🎯 代表景点 | 故宫、长城、天坛、首钢园、环球影城、国贸CBD |
| 🍜 代表美食 | 烤鸭、炸酱面、涮羊肉、炸串、炒菜、小吃 |
| 🗺️ 旅行攻略 | 六步时间轴指南 + 推荐三日路线 |
| 🤖 AI 行程 | 选择天数+偏好 → AI 生成个性化旅行攻略 |

---

## ✨ 项目特色

- **中韩双语**：全界面支持 中文 / 한국어 一键切换
- **三套主题**：中国红 / 首尔蓝 / 森林绿，渐变配色实时切换
- **原生架构**：纯 Flutter InheritedWidget 状态管理，零第三方状态管理依赖
- **本地图片**：所有图片使用 Asset 管理，替换 `assets/images/` 下同名文件即可
- **AI 集成**：调用 DeepSeek API 智能生成旅行攻略
- **无截断展示**：所有内容完整展示，无文字溢出

---

## 🚀 运行方法

```bash
# 1. 确保已安装 Flutter
flutter doctor

# 2. 进入项目目录
cd beijing_hometown

# 3. 获取依赖
flutter pub get

# 4. 运行
flutter run
```

---

## 🤖 AI 功能说明

AI 智能行程功能依赖 DeepSeek API。项目已内置占位 Key。

**直接运行**: 所有功能均可正常使用。AI 模块会提示"需要配置 API Key"，**不会报错或崩溃**。

**体验 AI 功能**:

1. 访问 [DeepSeek 开放平台](https://platform.deepseek.com/api_keys) 获取免费 API Key
2. 打开 `lib/services/api_config.dart`
3. 替换 `YOUR_DEEPSEEK_API_KEY_HERE` 为你的真实 Key
4. 重新运行即可使用 AI 功能

---

## 📁 项目结构

```
lib/
├── main.dart                    # 应用入口
├── screens/
│   ├── home_screen.dart         # 主页（单页滚动）
│   └── ai_planner_screen.dart   # AI 智能行程页面
├── services/
│   ├── ai_service.dart          # DeepSeek API 调用
│   ├── api_config.dart          # API Key 配置
│   └── api_config.example.dart  # 配置模板
├── utils/
│   ├── app_state.dart           # 全局状态管理
│   ├── constants.dart           # 图片路径 + 常量
│   ├── themes.dart              # 三套主题配色
│   └── translations.dart        # 中韩双语翻译
├── widgets/
│   ├── common_widgets.dart      # 公共组件
│   ├── hero_section.dart        # Hero 大图区
│   ├── area_section.dart        # 地区介绍
│   ├── attractions_section.dart # 旅游景点
│   ├── food_section.dart        # 代表美食
│   └── travel_section.dart      # 旅行攻略
└── assets/images/               # 本地图片（13张）
```

---

## 🛠️ 技术栈

| 技术 | 说明 |
|------|------|
| Flutter 3.41 | 跨平台 UI 框架 |
| Dart 3.11 | 使用 Records / Pattern Matching |
| InheritedWidget | 全局状态管理 |
| DeepSeek API | AI 行程生成 |

---

## ⚠️ 注意事项

- `api_config.dart` 中为占位 Key，教师可直接编译运行
- 图片替换：覆盖 `assets/images/` 下同名 .png 即可
- 需要 Dart ≥3.0（使用了 Records 语法）
