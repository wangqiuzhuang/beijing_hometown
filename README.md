# 北京 · 我的家乡  |  북경 · 나의 고향

> **Flutter 기말 과제  |  Flutter 期末作业**  
> 이름: 왕추장  |  姓名：王秋壮  
> 학번: 20232002  |  学号：20232002  
> 날짜: 2026년 6월  |  日期：2026 年 6 月

---

## 📱 프로젝트 개요  |  项目概览

베이징의 고향 정보를 소개하는 Flutter 단일 페이지 애플리케이션입니다.  
**중한 이중 언어 전환**, **멀티 테마 색상**, **풍부한 멀티미디어 콘텐츠**, 그리고 **🤖 AI 스마트 여행 일정 생성** 기능을 통합했습니다.

一个展示北京家乡信息的 Flutter 单页应用，融合**中韩双语切换**、**多主题配色**、**丰富的多媒体内容**和 **🤖 AI 智能行程生成**功能。

| 모듈 | 내용 | 内容 |
|------|------|------|
| 🏙️ 지역 소개 | 지하철·의료·교육·모바일결제·문화 | 地区介绍 |
| 🎯 관광 명소 | 자금성·만리장성·천단·수도강철단지·유니버설·궈마오 | 旅游景点 |
| 🍜 대표 음식 | 북경오리·자장몐·양고기샤브·튀김꼬치·볶음요리·전통간식 | 代表美食 |
| 🗺️ 여행 가이드 | 6단계 타임라인 + 3일 추천 코스 | 旅行攻略 |
| 🤖 AI 일정 | 선호도 선택 → AI 맞춤 여행 일정 생성 | AI 智能行程 |

---

## 🤖 AI 스마트 여행 일정 (핵심 기능)  |  AI 智能行程 (核心亮点)

**DeepSeek API 기반 구현**  |  **基于 DeepSeek API 实现**

이 프로젝트의 핵심 기능은 **DeepSeek Chat API**를 활용한 AI 여행 일정 생성입니다.  
사용자가 여행 일수와 관심사(역사문화·맛집·사진·쇼핑·자연·가족·예술·나이트라이프)를 선택하면,  
AI가 **베이징 전문 여행 플래너**로서 실시간으로 맞춤형 일정을 생성합니다.

本项目的核心功能是基于 **DeepSeek Chat API** 的 AI 行程生成。  
用户选择旅行天数和兴趣偏好（历史文化/美食/拍照/购物/自然/亲子/文艺/夜生活）后，  
AI 作为**北京专业旅行规划师**实时生成个性化行程攻略。

### 작동 원리  |  工作原理

```
사용자 선택 → Prompt 구성 → DeepSeek API 호출 → 결과 파싱 → 카드 형태로 표시
用户选择   → 构建Prompt → 调用DeepSeek API → 解析结果   → 精美卡片展示
```

- **모델 / 模型**: `deepseek-chat` (OpenAI 호환 형식 / 兼容 OpenAI 格式)
- **특징 / 特点**: 중국어 이해력 우수, 비용 저렴 (OpenAI의 약 1/10)
- **출력 형식 / 输出格式**: 【Day N】 으로 구분된 일별 일정
- **오류 처리 / 容错**: 네트워크 오류·API 오류 시 자동 재시도 안내

### 체험 방법  |  体验方式

> 🔑 실행 시 DeepSeek API Key를 컴파일 매개변수로 전달합니다.  
> 🔑 运行时通过编译参数传入 DeepSeek API Key，不写入代码中。

```bash
# 교사용 실행 명령어  |  教师运行命令
flutter run --dart-define=DEEPSEEK_KEY=sk-你的真实Key
```

> 💡 Key 발급: https://platform.deepseek.com/api_keys (신규 가입 무료 크레딧)  
> 💡 获取 Key: https://platform.deepseek.com/api_keys （新用户注册送免费额度）  
> Key가 없으면 AI 모듈은 설정 안내를 표시하고, 다른 기능은 정상 작동합니다.  
> 无 Key 时 AI 模块显示配置提示，其他功能不受影响。

---

## ✨ 주요 특징  |  项目特色

| 특징 | 설명 | 说明 |
|------|------|------|
| 🌐 이중 언어 | 전체 UI 중국어/한국어 실시간 전환, 관심 태그도 동기화 | 全界面中韩实时切换 |
| 🎨 3가지 테마 | 차이나레드·서울블루·포레스트그린, 그라데이션 색상 | 三套渐变主题配色 |
| 🏗️ 순수 아키텍처 | InheritedWidget 상태 관리, 제3자 라이브러리 무의존 | 原生架构无第三方依赖 |
| 🖼️ 로컬 이미지 | assets/images/ 동일 파일명 교체로 이미지 커스터마이징 | 本地图片可替换 |
| 📱 반응형 레이아웃 | IntrinsicHeight로 콘텐츠 높이 자동 조정, 텍스트 잘림 없음 | 自适应高度无截断 |

---

## 🚀 실행 방법  |  运行方法

```bash
flutter doctor          # Flutter 설치 확인
cd beijing_hometown     # 프로젝트 디렉토리로 이동
flutter pub get         # 의존성 설치
flutter run             # 실행
```

> **Flutter ≥3.41**, **Dart ≥3.0** 필요 (Records 문법 사용)

---

## 📁 프로젝트 구조  |  项目结构

```
lib/
├── main.dart                    # 앱 진입점 / 应用入口
├── screens/
│   ├── home_screen.dart         # 메인 페이지 (단일 스크롤)
│   └── ai_planner_screen.dart   # 🤖 AI 일정 생성 페이지
├── services/
│   └── ai_service.dart          # DeepSeek API 호출 서비스
├── utils/
│   ├── app_state.dart           # 언어+테마 상태 관리
│   ├── constants.dart           # 이미지 경로+상수
│   ├── themes.dart              # 3가지 테마 색상 정의
│   └── translations.dart        # 중한 번역 데이터
├── widgets/
│   ├── common_widgets.dart      # 공통 컴포넌트
│   ├── hero_section.dart        # Hero 대형 이미지 영역
│   ├── area_section.dart        # 지역 소개
│   ├── attractions_section.dart # 관광 명소
│   ├── food_section.dart        # 대표 음식
│   └── travel_section.dart      # 여행 가이드
└── assets/images/               # 로컬 이미지 (13장)
```

---

## 🛠️ 기술 스택  |  技术栈

| 기술 | 버전 | 용도 |
|------|------|------|
| Flutter | 3.41 | 크로스 플랫폼 UI 프레임워크 |
| Dart | 3.11 | Records / Pattern Matching 사용 |
| InheritedWidget | - | 전역 상태 관리 (제3자 무의존) |
| **DeepSeek API** | deepseek-chat | **AI 여행 일정 생성** |
| Material Design 3 | - | UI 디자인 시스템 |
| http | 1.6 | HTTP 통신 |

---

## 📝 참고 사항  |  备注

- 이미지 교체: `assets/images/` 폴더 내 동일 파일명 .png 파일로 덮어쓰기
- API Key는 `--dart-define` 으로 주입, 코드에 미포함 (보안)
- API Key 通过 `--dart-define` 注入，不包含在代码中（安全）
- **AI 키워드**: DeepSeek, 챗봇, AI 여행 플래너, 스마트 일정, 프롬프트 엔지니어링
