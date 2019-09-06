//
//  File.swift
//  jobplanetTest
//
//  Created by elon on 05/09/2019.
//  Copyright © 2019 elon. All rights reserved.
//

import Foundation

struct Stub {
    let jobplanet = """
        {
          "minimum_interviews": 0,
          "total_page": 31763,
          "minimum_reviews": 0,
          "total_count": 317624,
          "items": [
            {
              "ranking": 1,
              "cell_type": "CELL_TYPE_COMPANY",
              "interview_difficulty": 2.44,
              "name": "대교(주)",
              "salary_avg": 3483,
              "web_site": "",
              "logo_path": "https://jpassets.jobplanet.co.kr/production/uploads/company/logo/82465/thumb_25.png",
              "interview_question": "회사의 이익 규모에 대해 알고 있나?\\r\\n본인이 잘 할 수 있는 분야는?\\r\\n본인은 회사에서 장래 어떤 비전을 갖고 있나?",
              "company_id": 82465,
              "has_job_posting": "true",
              "rate_total_avg": 2.63,
              "industry_id": 500,
              "review_summary": "학습지 시장에서 높은 인지도를 가지고 있으나,\\r\\n학습지업 자체가 하락세이며 영업압박이 심함",
              "type": "INFO",
              "industry_name": "교육업",
              "simple_desc": "173 기업리뷰"
            },
            {
              "ranking": 1,
              "cell_type": "CELL_TYPE_COMPANY",
              "interview_difficulty": 3,
              "name": "바이널아이",
              "salary_avg": 2909,
              "web_site": "",
              "logo_path": "https://jpassets.jobplanet.co.kr/production/uploads/company/logo/88038/thumb______.jpg",
              "interview_question": "자기소개, 지원동기, 영어 가능여부, 기존 작업한 문서를 토대로 PT",
              "company_id": 88038,
              "has_job_posting": "false",
              "rate_total_avg": 2.74,
              "industry_id": 800,
              "review_summary": "제안, 운영 디바이스 가리지 않고 다양한 업무의 경험과 뒷받침 되는 엄청난 포트폴리오를 쌓을 수 있다. 특히나 뉴미디어 쪽으로의 경험과 커리어를 쌓고 싶다면 강추",
              "type": "INFO",
              "industry_name": "미디어/디자인",
              "simple_desc": "42 기업리뷰"
            },
            {
              "count": 4,
              "themes": [
                {
                  "color": "#f78f09",
                  "cover_image": "https://jpassets.jobplanet.co.kr/production/uploads/job/theme/bg_image/34/thumb_theme_06_03app.png",
                  "id": 34,
                  "title": "월급 도둑. 공범 모집중."
                },
                {
                  "color": "#b38cee",
                  "cover_image": "https://jpassets.jobplanet.co.kr/production/uploads/job/theme/bg_image/33/thumb_theme_05_03app.png",
                  "id": 33,
                  "title": "개발이 적성이라면"
                },
                {
                  "color": "#f78f09",
                  "cover_image": "https://jpassets.jobplanet.co.kr/production/uploads/job/theme/bg_image/21/thumb_App_Startup.jpg",
                  "id": 21,
                  "title": "엄마, 대기업만 답이 아니에요!"
                },
                {
                  "color": "#9dcd72",
                  "cover_image": "https://jpassets.jobplanet.co.kr/production/uploads/job/theme/bg_image/39/thumb_theme_10_03app.jpg",
                  "id": 39,
                  "title": "이번주 꼭 지원해야 할 회사   "
                }
              ],
              "cell_type": "CELL_TYPE_HORIZONTAL_THEME"
            },
            {
              "ranking": 1,
              "cell_type": "CELL_TYPE_COMPANY",
              "interview_difficulty": 2.85,
              "name": "유라코퍼레이션(주)",
              "salary_avg": 4047,
              "web_site": "",
              "logo_path": "https://jpassets.jobplanet.co.kr/production/uploads/company/logo/60172/thumb___________.png",
              "interview_question": "1차) 자기소개와 함께 지원하신 동기 말씀해주세요.\\n      와이어링 설계에서 무엇이 중요하다고 생각하나\\n      그외 이력서 특이사항 질문\\n2차) 학교에서 무엇을 배웠나? \\n        또는 학교에서 무엇을 하였는가?\\n        ",
              "company_id": 60172,
              "has_job_posting": "false",
              "rate_total_avg": 2.77,
              "industry_id": 200,
              "review_summary": "글로벌한 근무환경과 다양한 직무경험 보수적인 분위기",
              "type": "INFO",
              "industry_name": "제조/화학",
              "simple_desc": "149 기업리뷰"
            },
            {
              "occupation_ids": [
                10702
              ],
              "is_interview": "false",
              "job_type_ids": [
                3
              ],
              "city_ids": [
                1
              ],
              "deadline": {
                "color": "gray",
                "message": "마감",
                "type": "CLOSED",
                "hex_color": "#7c8b97"
              },
              "recruitment_type_ids": [
                2
              ],
              "logo": "https://jpassets.jobplanet.co.kr/production/uploads/company/logo/63862/thumb_146.jpg",
              "id": 41643,
              "review_avg_cache": 3.34,
              "cell_type": "CELL_TYPE_JOB_POSTING",
              "title": "법무팀",
              "company_id": 63862,
              "label_id": "",
              "is_saved": "false",
              "company_name": "엘지생명과학(주)"
            },
            {
              "ranking": 1,
              "cell_type": "CELL_TYPE_COMPANY",
              "interview_difficulty": 2.25,
              "name": "젬스메디컬(주)",
              "salary_avg": 3067,
              "web_site": "",
              "logo_path": "https://jpassets.jobplanet.co.kr/production/uploads/company/logo/56099/thumb_56099.JPG",
              "interview_question": "1. 업무 관련 지식에 대한 질문\\r\\n2. 협업과 관련된 사람들을 대하는 태도 질문\\r\\n3. 할 수 있는 일과 하고 싶은 일\\r\\n4. 본인의 장단점에 관한 질문",
              "company_id": 56099,
              "has_job_posting": "false",
              "rate_total_avg": 2.38,
              "industry_id": 200,
              "review_summary": "개발/연구 등 많은 투자를 통해서 DR시스템업체로 발돋움을 하려고 하였으나 경영진의 이원화 및 집중화 부족으로 예측할 수 없는 상황",
              "type": "INFO",
              "industry_name": "제조/화학",
              "simple_desc": "13 기업리뷰"
            },
            {
              "ranking": 1,
              "cell_type": "CELL_TYPE_REVIEW",
              "cons": "지사로써의 한계. 모든 결정 및 책임은 본사로부터 나옴. 너무 비용만을 고려한 의사결정은 회사에 대한 충성도를 떨어 뜨림",
              "name": "퀄컴씨디엠에이테크날러지코리아(유)",
              "days_ago": 311,
              "logo_path": "https://jpassets.jobplanet.co.kr/production/uploads/company/logo/6991/thumb_____35.PNG",
              "pros": "매니저의 눈치를 거의 안보고 업무만 집중할 수 있는 분위기. 높은 수준의 연봉. 업계 최고의 기술력을 보유하고 있음. 체계화된 프로세스등 배울 것이 많음. 해외의 유능한 엔지니어와의 소통을 통해 느끼고 배울수 있는 기회",
              "company_id": 6991,
              "occupation_name": "IT/인터넷",
              "rate_total_avg": 4.25,
              "industry_id": 400,
              "date": "2015-10-24T21:17:50.000+09:00",
              "review_summary": "자기가 한만큼 인정 받고 대접을 받을 수 있는 곳",
              "type": "REVIEW",
              "industry_name": "유통/무역/운송",
              "simple_desc": "12 기업리뷰"
            },
            {
              "ranking": 1,
              "cell_type": "CELL_TYPE_COMPANY",
              "interview_difficulty": 3.25,
              "name": "한국원자력의학원",
              "salary_avg": 3209,
              "web_site": "",
              "logo_path": "https://jpassets.jobplanet.co.kr/production/uploads/company/logo/3247/thumb_________.png",
              "interview_question": "지원하는 직무에 본인이 적합한 이유를 설명하시오.\\n지원하는 직무가 하는일을 설명하시오.",
              "company_id": 3247,
              "has_job_posting": "true",
              "rate_total_avg": 3,
              "industry_id": 1000,
              "review_summary": "교통이 괜찮고 넉넉한 근무, 하지만 챗바퀴 도는 기분",
              "type": "INFO",
              "industry_name": "기관/협회",
              "simple_desc": "25 기업리뷰"
            },
            {
              "ranking": 1,
              "cell_type": "CELL_TYPE_COMPANY",
              "interview_difficulty": 3.24,
              "name": "가비아(주)",
              "salary_avg": 3357,
              "web_site": "",
              "logo_path": "https://jpassets.jobplanet.co.kr/production/uploads/company/logo/86149/thumb____.png",
              "interview_question": "고객이 홈페이지를 제작하고 싶어한다. 어떻게 응대를 하겠느냐 ",
              "company_id": 86149,
              "has_job_posting": "true",
              "rate_total_avg": 3.41,
              "industry_id": 700,
              "review_summary": "매너리즘 심각함, 부서에 따라서 업무량과 부담이 확 다름.",
              "type": "INFO",
              "industry_name": "IT/웹/통신",
              "simple_desc": "74 기업리뷰"
            },
            {
              "ranking": 1,
              "cell_type": "CELL_TYPE_REVIEW",
              "cons": "고객의 니즈에 맞춰 제품 제작이 이루어져 관련 기술응용 함에 좋으나 표준 제품 제작보다 시간이 좀 더 투입됨.",
              "name": "한미반도체(주)",
              "days_ago": 721,
              "logo_path": "https://jpassets.jobplanet.co.kr/production/uploads/company/logo/2679/thumb_2679.png",
              "pros": "반도체 관련 산업 전망에 대해 이해할 수 있으며 이름도 알려져 있어 커리어 관리하기에는 좋음.",
              "company_id": 2679,
              "occupation_name": "경영/기획/컨설팅",
              "rate_total_avg": 2.37,
              "industry_id": 200,
              "date": "2014-09-09T18:04:31.000+09:00",
              "review_summary": "반도체 후공정 장비 1위 인지도는 있음",
              "type": "REVIEW",
              "industry_name": "제조/화학",
              "simple_desc": "49 기업리뷰"
            },
            {
              "ranking": 1,
              "cell_type": "CELL_TYPE_COMPANY",
              "interview_difficulty": 2.91,
              "name": "위메프(주)",
              "salary_avg": 2828,
              "web_site": "",
              "logo_path": "https://jpassets.jobplanet.co.kr/production/uploads/company/logo/60632/thumb_______.png",
              "interview_question": "1. 전 직장에서 했던 일\\r\\n2. 위메프에 입사하려는 이유\\r\\n3. 성취한 일, 실패한 일. 교훈",
              "company_id": 60632,
              "has_job_posting": "true",
              "rate_total_avg": 2.53,
              "industry_id": 400,
              "review_summary": "AMD도 MD가 될 수 있는 기회가 열린 곳. 열정을 높이 사는 곳, 신입 분들에게 권합니다. 매우 빠르게 성장하면서 성장통을 겪고 있는 회사. 과도한 업무, 체계 부족이 문제이지만 문제 개선을 위해 노력하는 회사.",
              "type": "INFO",
              "industry_name": "유통/무역/운송",
              "simple_desc": "325 기업리뷰"
            },
            {
              "occupation_ids": [
                11707,
                11706
              ],
              "is_interview": "false",
              "job_type_ids": [
                3
              ],
              "city_ids": [
                2
              ],
              "deadline": {
                "color": "gray",
                "message": "마감",
                "type": "CLOSED",
                "hex_color": "#7c8b97"
              },
              "recruitment_type_ids": [
                2
              ],
              "logo": "https://jpassets.jobplanet.co.kr/production/uploads/company/logo/88463/thumb_______________.png",
              "id": 35262,
              "review_avg_cache": 3.39,
              "cell_type": "CELL_TYPE_JOB_POSTING",
              "title": "[NHN Ent.] 게임 이펙트",
              "company_id": 88463,
              "label_id": "",
              "is_saved": "false",
              "company_name": "엔에이치엔엔터테인먼트(주)"
            },
            {
              "occupation_ids": [
                11710
              ],
              "is_interview": "false",
              "job_type_ids": [
                4
              ],
              "city_ids": [
                2
              ],
              "deadline": {
                "color": "gray",
                "message": "마감",
                "type": "CLOSED",
                "hex_color": "#7c8b97"
              },
              "recruitment_type_ids": [
                1
              ],
              "logo": "https://jpassets.jobplanet.co.kr/production/uploads/company/logo/67611/thumb_67611.JPG",
              "id": 39818,
              "review_avg_cache": 2.92,
              "cell_type": "CELL_TYPE_JOB_POSTING",
              "title": "문완구 제품 디자이너",
              "company_id": 67611,
              "label_id": "",
              "is_saved": "false",
              "company_name": "아이코닉스(주)"
            },
            {
              "ranking": 1,
              "cell_type": "CELL_TYPE_COMPANY",
              "interview_difficulty": 2.33,
              "name": "미래디자인아이엠씨(주)",
              "salary_avg": 0,
              "web_site": "",
              "logo_path": "https://jpassets.jobplanet.co.kr/assets/default_logo_share-12e4cb8f87fe87d4c2316feb4cb33f42d7f7584f2548350d6a42e47688a00bd0.png",
              "interview_question": "전에 직장에서 무슨업무를 했었는가 연봉은 얼마정도 생각하는가 압박질문은 없었다. 부모님께서 무슨 일하시나 물어보시며 비웃으셨다......",
              "company_id": 311583,
              "has_job_posting": "false",
              "rate_total_avg": 0,
              "industry_id": 800,
              "review_summary": "",
              "type": "INFO",
              "industry_name": "미디어/디자인",
              "simple_desc": ""
            },
            {
              "ranking": 1,
              "cell_type": "CELL_TYPE_COMPANY",
              "interview_difficulty": 3.09,
              "name": "엘지전자(주)",
              "salary_avg": 4870,
              "web_site": "",
              "logo_path": "https://jpassets.jobplanet.co.kr/production/uploads/company/logo/19514/thumb_1.jpg",
              "interview_question": "직무면접은 수행했던 PJT의 프레젠테이션\\r\\n인성면접은 일반적인 인성질문",
              "company_id": 19514,
              "has_job_posting": "true",
              "rate_total_avg": 3.04,
              "industry_id": 200,
              "review_summary": "Google 및 Qualcomm, Broadcom, Mediatek 등 다양한 Vendor들과 일하는 경험을 쌓을 수 있다. (MC)",
              "type": "INFO",
              "industry_name": "제조/화학",
              "simple_desc": "1624 기업리뷰"
            },
            {
              "ranking": 1,
              "cell_type": "CELL_TYPE_REVIEW",
              "cons": "명절 상여금x. 소프트크림및 치킨을 팔아서 관리하는데 손이 자주감 . 승진하려면 일본어 잘해야되서 이직률도 높은듯",
              "name": "한국미니스톱(주)",
              "days_ago": 261,
              "logo_path": "https://jpassets.jobplanet.co.kr/production/uploads/company/logo/3585/thumb_3585.png",
              "pros": "돈은 많이주는편. 초봉이 세금띠고 3250정도 되는듯. 6개월 점장생활을 거친뒤, 15개 매장을 관리한다. 편의점 숫자는 전국4등이지만 점포당 매출액은 1위",
              "company_id": 3585,
              "occupation_name": "영업/제휴",
              "rate_total_avg": 2.52,
              "industry_id": 400,
              "date": "2015-12-14T00:23:23.000+09:00",
              "review_summary": "전형적인 일본식회사. 한국 특유의 매출압박은 없으나,상여금 및 명절떡값도 없음 (개인주의가 심해서 특유의  소속감 부재)",
              "type": "REVIEW",
              "industry_name": "유통/무역/운송",
              "simple_desc": "125 기업리뷰"
            },
            {
              "ranking": "--",
              "cell_type": "CELL_TYPE_SALARY",
              "name": "한국엔티엔판매(주)",
              "salary_avg": 6263,
              "logo_path": "https://jpassets.jobplanet.co.kr/assets/default_logo_share-12e4cb8f87fe87d4c2316feb4cb33f42d7f7584f2548350d6a42e47688a00bd0.png",
              "salary_ranking": "--",
              "company_id": 3299,
              "hide_detail": 0,
              "signed_in": 1,
              "salary_lowest": 3200,
              "rate_total_avg": 0,
              "industry_id": 400,
              "salary_highest": 7330,
              "type": "SALARY",
              "industry_name": "유통/무역/운송",
              "simple_desc": "9 연봉정보"
            },
            {
              "ranking": "12",
              "cell_type": "CELL_TYPE_SALARY",
              "name": "메리츠종합금융증권(주)",
              "salary_avg": 7696,
              "logo_path": "https://jpassets.jobplanet.co.kr/production/uploads/company/logo/34694/thumb_289.jpg",
              "salary_ranking": "12",
              "company_id": 34694,
              "hide_detail": 0,
              "signed_in": 1,
              "salary_lowest": 2800,
              "rate_total_avg": 3.8,
              "industry_id": 900,
              "salary_highest": 16412,
              "type": "SALARY",
              "industry_name": "은행/금융업",
              "simple_desc": "61 연봉정보"
            },
            {
              "ranking": 1,
              "cell_type": "CELL_TYPE_INTERVIEW",
              "interview_difficulty": 3.26,
              "name": "에스케이건설(주)",
              "logo_path": "https://jpassets.jobplanet.co.kr/production/uploads/company/logo/20640/thumb__________.png",
              "interview_question": "대면 질문중에 SK건설의 인재상에 부합되는 경험을 얘기해보는 질의응답이 있었습니다. \\r\\n어떤 문제를 도전적으로 실행한것이 있는지... 그리고 나머지는 자세히 생각이 나지 않지만 경험을 많이 물어보았습니다.",
              "interview_range_end": 3.2,
              "company_id": 20640,
              "interview_answer": "",
              "interview_summary": "14년 여름방학 인턴을 하고 전환되는 전형이였습니다. \\r\\n서류를 합격하고 나서 SKCT시험을 쳤습니다. 같이 응시한 사람이 거의 50명 정도인것 같구요. 거기서 걸러진 사람이 16명이였습니다. 그 16명이 인턴 면접을 보았습니다. \\r\\n제가 낸 부서는 품질팀이였는데 부서 팀장님과 1:1 면접을 보았습니다. \\r\\n면접시간이 1시간 20분으로 다른 지원자들과는 다르게 오래 본것 같네요 \\r\\n그리고 합격을 하고 3주동안의 인턴을 겪고 마지막날에 본부장님과의 면접이 있었습니다. \\r\\n전공이나 압박면접이 아닌 인성면접이여서 편안한 분위기에서 면접을 보았던것 같습니다. \\r\\n최종면접을 실시하고 약 2주뒤에 최종 합격문자와 메일이 왔습니다.",
              "rate_total_avg": 3.28,
              "industry_id": 600,
              "interview_desc": "2014-07-01에 면접을 봤습니다.",
              "interview_range_start": 2.3,
              "type": "INTERVIEW",
              "industry_name": "건설업",
              "simple_desc": "116 면접후기"
            },
            {
              "ranking": "41",
              "cell_type": "CELL_TYPE_SALARY",
              "name": "경남에너지(주)",
              "salary_avg": 6725,
              "logo_path": "https://jpassets.jobplanet.co.kr/production/uploads/company/logo/45819/thumb_45819.JPG",
              "salary_ranking": "41",
              "company_id": 45819,
              "hide_detail": 0,
              "signed_in": 1,
              "salary_lowest": 2400,
              "rate_total_avg": 4,
              "industry_id": 200,
              "salary_highest": 15775,
              "type": "SALARY",
              "industry_name": "제조/화학",
              "simple_desc": "64 연봉정보"
            },
            {
              "ranking": "31",
              "cell_type": "CELL_TYPE_SALARY",
              "name": "대우송도개발(주)",
              "salary_avg": 7057,
              "logo_path": "https://jpassets.jobplanet.co.kr/production/uploads/company/logo/87803/thumb__________.png",
              "salary_ranking": "31",
              "company_id": 87803,
              "hide_detail": 0,
              "signed_in": 1,
              "salary_lowest": 3500,
              "rate_total_avg": 0,
              "industry_id": 400,
              "salary_highest": 17095,
              "type": "SALARY",
              "industry_name": "유통/무역/운송",
              "simple_desc": "52 연봉정보"
            },
            {
              "count": 3,
              "themes": [
                {
                  "color": "#ff9f97",
                  "cover_image": "https://jpassets-staging.jobplanet.co.kr/staging/uploads/job/theme/bg_image/41/thumb_theme_12_03app.jpg",
                  "id": 41,
                  "title": "은행. 불확실성과의 싸움.  "
                },
                {
                  "color": "#9dcd72",
                  "cover_image": "https://jpassets-staging.jobplanet.co.kr/staging/uploads/job/theme/bg_image/32/thumb_theme_04_03app.png",
                  "id": 32,
                  "title": "찾습니다. 신입을."
                },
                {
                  "color": "#9dcd72",
                  "cover_image": "https://jpassets-staging.jobplanet.co.kr/staging/uploads/job/theme/bg_image/39/thumb_theme_10_03app.jpg",
                  "id": 39,
                  "title": "이번주 꼭 지원해야 할 회사   "
                },
                {
                  "color": "#ff9f97",
                  "cover_image": "https://jpassets-staging.jobplanet.co.kr/staging/uploads/job/theme/bg_image/41/thumb_theme_12_03app.jpg",
                  "id": 41,
                  "title": "은행. 불확실성과의 싸움.  "
                },
                {
                  "color": "#9dcd72",
                  "cover_image": "https://jpassets-staging.jobplanet.co.kr/staging/uploads/job/theme/bg_image/32/thumb_theme_04_03app.png",
                  "id": 32,
                  "title": "찾습니다. 신입을."
                }
              ],
              "cell_type": "CELL_TYPE_HORIZONTAL_THEME",
              "smb": []
            },
            {
              "ranking": 1,
              "cell_type": "CELL_TYPE_COMPANY",
              "interview_difficulty": 3,
              "name": "시내엔들(주)",
              "salary_avg": 0,
              "web_site": "",
              "logo_path": "https://jpassets.jobplanet.co.kr/assets/default_logo_share-12e4cb8f87fe87d4c2316feb4cb33f42d7f7584f2548350d6a42e47688a00bd0.png",
              "interview_question": "편안한 분위기에서 불편한 질문들, 사적인 질문 많음. 압박면접이라 생각하면 괜찮으나 개인적으로 불편했음. 나중엔 속으로 '에라 모르겠다 나 뽑든말든 맘대로해라'라는 심보가 자라남. ",
              "company_id": 70508,
              "has_job_posting": "false",
              "rate_total_avg": 0,
              "industry_id": 400,
              "review_summary": "",
              "type": "INFO",
              "industry_name": "유통/무역/운송",
              "simple_desc": ""
            },
            {
              "ranking": 1,
              "cell_type": "CELL_TYPE_INTERVIEW",
              "interview_difficulty": 2.98,
              "name": "올림푸스한국(주)",
              "logo_path": "https://jpassets.jobplanet.co.kr/production/uploads/company/logo/17302/thumb_17302.png",
              "interview_question": "자신이 이력서, 자소서에 적은 내용을 정확하게 숙지하고 가야함.\\r\\n내가 생각하기에 사소한 부분을 물어봄.\\r\\n취미에 관한 것까지 물어봄.",
              "interview_range_end": 3.2,
              "company_id": 17302,
              "interview_answer": "",
              "interview_summary": "경력직 면접에서 경영/실무진 총 5명이 들어  오셔서 깜짝 놀랐음. 5대 1면접.\\r\\n질문의 95%는 한분이 다 하심.(결정권자로 추정)\\r\\n30~40분정도 면접을 진행했고 비교적 편한한 분위기였음.\\r\\n압박면접은 없었음.",
              "rate_total_avg": 2.3,
              "industry_id": 400,
              "interview_desc": "2012-06-01에 온라인 지원을 통해 면접을 봤고 결과가 나오기까지 1일이 걸렸습니다.",
              "interview_range_start": 2.3,
              "type": "INTERVIEW",
              "industry_name": "유통/무역/운송",
              "simple_desc": "57 면접후기"
            },
            {
              "ranking": 1,
              "cell_type": "CELL_TYPE_INTERVIEW",
              "interview_difficulty": 3.28,
              "name": "태평양물산(주)",
              "logo_path": "https://jpassets.jobplanet.co.kr/production/uploads/company/logo/6068/thumb_323.jpg",
              "interview_question": "토론면접에서는 야근으로 지각한 인원에 대한 대처방안에 대해 토론함 지원자 총 5명씩 한팀, 모든면접 함께 진행함\\r\\n\\r\\npt면접에서는 랜덤으로 주제를 고른 후, 7분동안 a4용지에 생각을 정리후 3분동안 바로 발표함, 순번이 앞에있을수록 불리함(준비시간 부족), \\r\\n\\r\\n인성면접에서는 한 사람당 10~15분간 심도있게 질문했음. 질문내용은 평이했으며 영어질문도 포함됨\\r\\n\\r\\n1차에서 떨어짐, 인성면접시 체크사항을 보니 높은 편이었음, 다만 토론과 pt에서 처음이었고 준비부족으로 헛소리를 함.(원인)",
              "interview_range_end": 3.2,
              "company_id": 6068,
              "interview_answer": "",
              "interview_summary": "서류통과후 인적성 검사,  1차면접에서 pt및 토론, 인성면접 실시함   2차 면접이 마지막",
              "rate_total_avg": 3.52,
              "industry_id": 200,
              "interview_desc": "면접을 봤습니다.",
              "interview_range_start": 2.3,
              "type": "INTERVIEW",
              "industry_name": "제조/화학",
              "simple_desc": "100 면접후기"
            }
          ],
          "page": 1,
          "page_size": 10,
          "minimum_salaries": 0
        }
        """
}
