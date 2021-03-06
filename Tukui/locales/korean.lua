local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales

if T.client == "koKR" then
 
	L.chat_BATTLEGROUND_GET = "[B]"
	L.chat_BATTLEGROUND_LEADER_GET = "[B]"
	L.chat_BN_WHISPER_GET = "[FR]"
	L.chat_GUILD_GET = "[G]"
	L.chat_OFFICER_GET = "[O]"
	L.chat_PARTY_GET = "[P]"
	L.chat_PARTY_GUIDE_GET = "[P]"
	L.chat_PARTY_LEADER_GET = "[P]"
	L.chat_RAID_GET = "[R]"
	L.chat_RAID_LEADER_GET = "[R]"
	L.chat_RAID_WARNING_GET = "[W]"
	L.chat_WHISPER_GET = "[FR]"
	L.chat_FLAG_AFK = "[AFK]"
	L.chat_FLAG_DND = "[DND]"
	L.chat_FLAG_GM = "[GM]"
	L.chat_ERR_FRIEND_ONLINE_SS = "|cff298F00접속|r했습니다"
	L.chat_ERR_FRIEND_OFFLINE_S = "|cffff0000접속종료|r했습니다"
 
	L.chat_general = "일반"
	L.chat_trade = "거래"
	L.chat_defense = "수비"
	L.chat_recrutment = "길드모집"
	L.chat_lfg = "파티찾기"
 
	L.disband = "공격대를 해체합니다."
 
	L.datatext_download = "다운로드: "
	L.datatext_bandwidth = "대역폭: "
	L.datatext_guild = "길드"
	L.datatext_noguild = "길드 없음"
	L.datatext_bags = "소지품: "
	L.datatext_friends = "친구"
	L.datatext_online = "온라인: "
	L.datatext_armor = "방어구"
	L.datatext_earned = "수입:"
	L.datatext_spent = "지출:"
	L.datatext_deficit = "적자:"
	L.datatext_profit = "흑자:"
	L.datatext_timeto = "전투 시간"
	L.datatext_friendlist = "친구 목록:"
	L.datatext_playersp = "주문력"
	L.datatext_playerap = "전투력"
	L.datatext_playerhaste = "가속도"
	L.datatext_dps = "dps"
	L.datatext_hps = "hps"
	L.datatext_playerarp = "방관"
	L.datatext_session = "세션: "
	L.datatext_character = "캐릭터: "
	L.datatext_server = "서버: "
	L.datatext_totalgold = "전체: "
	L.datatext_savedraid = "귀속된 던전"
	L.datatext_currency = "화폐:"
	L.datatext_fps = " fps & "
	L.datatext_ms = " ms"
	L.datatext_playercrit = " 치명타율"
	L.datatext_playerheal = " 극대화율"
	L.datatext_avoidancebreakdown = "완방 수치"
	L.datatext_lvl = "레벨"
	L.datatext_boss = "우두머리"
	L.datatext_miss = "빗맞힘"
	L.datatext_dodge = "회피율"
	L.datatext_block = "방패 막기"
	L.datatext_parry = "무기 막기"
	L.datatext_playeravd = "완방: "
	L.datatext_servertime = "서버 시간: "
	L.datatext_localtime = "지역 시간: "
	L.datatext_mitigation = "레벨에 따른 경감수준: "
	L.datatext_healing = "치유량 : "
	L.datatext_damage = "피해량 : "
	L.datatext_honor = "명예 점수 : "
	L.datatext_killingblows = "결정타 : "
	L.datatext_ttstatsfor = "점수 : "
	L.datatext_ttkillingblows = "결정타:"
	L.datatext_tthonorkills = "명예 승수:"
	L.datatext_ttdeaths = "죽은 수:"
	L.datatext_tthonorgain = "획득한 명예:"
	L.datatext_ttdmgdone = "피해량:"
	L.datatext_tthealdone = "치유량:"
	L.datatext_basesassaulted = "거점 공격:"
	L.datatext_basesdefended = "거점 방어:"
	L.datatext_towersassaulted = "경비탑 점령:"
	L.datatext_towersdefended = "경비탑 방어:"
	L.datatext_flagscaptured = "깃발 쟁탈:"
	L.datatext_flagsreturned = "깃발 반환:"
	L.datatext_graveyardsassaulted = "무덤 점령:"
	L.datatext_graveyardsdefended = "무덤 방어:"
	L.datatext_demolishersdestroyed = "파괴한 파괴전차:"
	L.datatext_gatesdestroyed = "파괴한 관문:"
	L.datatext_totalmemusage = "총 메모리 사용량:"
	L.datatext_control = "현재 진영:"
 
	L.bg_warsong = "전쟁노래 협곡"
	L.bg_arathi = "아라시 분지"
	L.bg_eye = "폭풍의 눈"
	L.bg_alterac = "알터랙 계곡"
	L.bg_strand = "고대의 해안"
	L.bg_isle = "정복의 섬"
 
	L.Slots = {
	  [1] = {1, "머리", 1000},
	  [2] = {3, "어깨", 1000},
	  [3] = {5, "가슴", 1000},
	  [4] = {6, "허리", 1000},
	  [5] = {9, "손목", 1000},
	  [6] = {10, "손", 1000},
	  [7] = {7, "다리", 1000},
	  [8] = {8, "발", 1000},
	  [9] = {16, "주장비", 1000},
	  [10] = {17, "보조장비", 1000},
	  [11] = {18, "원거리", 1000}
	}
 
	L.popup_disableui = "Tukui는 현재 해상도에 최적화되어 있지 않습니다. Tukui를 비활성화하시겠습니까? (다른 해상도로 시도해보려면 취소)"
	L.popup_install = "현재 캐릭터는 Tukui를 처음 사용합니다. 행동 단축바, 대화창, 다양한 설정을 위해 UI를 다시 시작하셔야만 합니다."
	L.popup_2raidactive = "2개의 공격대 인터페이스가 사용 중입니다. 한 가지만 사용하셔야 합니다."
	L.popup_reset = "경고! Tukui의 모든것을 기본값으로 변경합니다. 실행하시겠습니까?"
	L.popup_install_yes = "예"
	L.popup_install_no = "아니오"
	L.popup_reset_yes = "예"
	L.popup_reset_no = "아니오"
 
	L.merchant_repairnomoney = "수리에 필요한 돈이 충분하지 않습니다!"
	L.merchant_repaircost = "모든 아이템이 수리되었습니다: "
	L.merchant_trashsell = "불필요한 아이템이 판매되었습니다: "
 
	L.goldabbrev = "|cffffd700●|r"
	L.silverabbrev = "|cffc7c7cf●|r"
	L.copperabbrev = "|cffeda55f●|r"
 
	L.error_noerror = "오류가 발견되지 않았습니다."
 
	L.unitframes_ouf_offline = "오프라인"
	L.unitframes_ouf_dead = "죽음"
	L.unitframes_ouf_ghost = "유령"
	L.unitframes_ouf_lowmana = "마나 적음"
	L.unitframes_ouf_threattext = "현재 대상에 대한 위협수준:"
	L.unitframes_ouf_offlinedps = "오프라인"
	L.unitframes_ouf_deaddps = "|cffff0000[죽음]|r"
	L.unitframes_ouf_ghostheal = "유령"
	L.unitframes_ouf_deadheal = "죽음"
	L.unitframes_ouf_gohawk = "매의 상으로 전환"
	L.unitframes_ouf_goviper = "독사의 상으로 전환"
	L.unitframes_disconnected = "연결끊김"
	L.unitframes_ouf_wrathspell = "격노"
	L.unitframes_ouf_starfirespell = "별빛 섬광"
 
	L.tooltip_count = "개수"
 
	L.bags_noslots = "소지품이 가득 찼습니다."
	L.bags_costs = "가격: %.2f 골"
	L.bags_buyslots = "가방 보관함을 추가로 구입하시려면 /bags를 입력해주세요."
	L.bags_openbank = "먼저 은행을 열어야 합니다."
	L.bags_sort = "열려있는 가방이나 은행에 있는 아이템을 정리합니다."
	L.bags_stack = "띄엄띄엄 있는 아이템을 정리합니다."
	L.bags_buybankslot = "가방 보관함을 추가로 구입합니다."
	L.bags_search = "검색"
	L.bags_sortmenu = "분류"
	L.bags_sortspecial = "특수물품 분류"
	L.bags_stackmenu = "정리"
	L.bags_stackspecial = "특수물품 정리"
	L.bags_showbags = "가방 보기"
	L.bags_sortingbags = "분류 완료."
	L.bags_nothingsort= "분류할 것이 없습니다."
	L.bags_bids = "사용 중인 가방: "
	L.bags_stackend = "재정리 완료."
	L.bags_rightclick_search = "검색하려면 오른쪽 클릭"
 
	L.chat_invalidtarget = "잘못된 대상"
 
	L.mount_wintergrasp = "겨울손아귀"
 
	L.core_autoinv_enable = "자동초대 활성화: 초대"
	L.core_autoinv_enable_c = "자동초대 활성화: "
	L.core_autoinv_disable = "자동초대 비활성화"
	L.core_wf_unlock = "임무 추적창 잠금 해제"
	L.core_wf_lock = "임무 추적창 잠금"
	L.core_welcome1 = "|cffC495DDTukui|r를 사용해주셔서 감사합니다. 버전 "
	L.core_welcome2 = "자세한 사항은 |cff00FFFF/uihelp|r를 입력하거나 www.tukui.org 에 방문하시면 확인 가능합니다."
 
	L.core_uihelp1 = "|cff00ff00일반적인 명령어|r"
	L.core_uihelp2 = "|cffFF0000/moveui|r - 화면 주위 요소들을 잠금해제하고 이동합니다."
	L.core_uihelp3 = "|cffFF0000/rl|r - 당신의 인터페이스를 다시 불러옵니다."
	L.core_uihelp4 = "|cffFF0000/gm|r - 도움 요청(지식 열람실, GM 요청하기) 창을 엽니다."
	L.core_uihelp5 = "|cffFF0000/frame|r - 커서가 위치한 창의 이름을 보여줍니다. (lua 편집 시 매우 유용)"
	L.core_uihelp6 = "|cffFF0000/heal|r - 힐러용 공격대 레이아웃을 사용합니다."
	L.core_uihelp7 = "|cffFF0000/dps|r - DPS/탱커용 레이아웃을 사용합니다."
	L.core_uihelp8 = "|cffFF0000/bags|r - 분류, 정리, 가방 보관함을 추가 구입을 할 수 있습니다."
	L.core_uihelp9 = "|cffFF0000/resetui|r - Tukui를 기본값으로 초기화 합니다."
	L.core_uihelp10 = "|cffFF0000/rd|r - 공격대를 해체합니다."
	L.core_uihelp11 = "|cffFF0000/ainv|r - 자동초대 기능을 사용합니다. '/ainv 단어'를 입력하여 해당 단어가 들어간 귓속말이 올 경우 자동으로 초대를 합니다."
	L.core_uihelp100 = "(위로 올리십시오 ...)"
 
	L.symbol_CLEAR = "초기화"
	L.symbol_SKULL = "해골"
	L.symbol_CROSS = "가위표"
	L.symbol_SQUARE = "네모"
	L.symbol_MOON = "달"
	L.symbol_TRIANGLE = "세모"
	L.symbol_DIAMOND = "다이아몬드"
	L.symbol_CIRCLE = "동그라미"
	L.symbol_STAR = "별"
 
	L.bind_combat = "전투 중에는 단축키를 지정할 수 없습니다."
	L.bind_saved = "새로 지정한 모든 단축키가 저장되었습니다."
	L.bind_discard = "새로 지정한 모든 단축키가 저장되지 않았습니다."
	L.bind_instruct = "커서가 위치한 단축버튼에 단축키를 지정할 수 있습니다. 오른쪽 클릭으로 해당 단축버튼의 단축키를 초기화할 수 있습니다."
	L.bind_save = "저장"
	L.bind_discardbind = "취소"
 
	L.hunter_unhappy = "소환수의 만족도: 불만족"
	L.hunter_content = "소환수의 만족도: 만족"
	L.hunter_happy = "소환수의 만족도: 매우 만족"
	
	L.move_tooltip = "툴팁 이동"
	L.move_minimap = "미니맵 이동"
	L.move_watchframe = "퀘스트 이동"
	L.move_gmframe = "대기표 이동"
	L.move_buffs = "플레이어 버프 이동"
	L.move_debuffs = "플레이어 디버프 이동"
	L.move_shapeshift = "태세/토템 바 이동"
	L.move_achievements = "업적창 이동"
	L.move_roll = "주사위 창 이동"
	L.move_vehicle = "탈것 창 이동"
	L.move_durability = "Move Durability"
	
	L.actionbars_locked = "Actionbars |cffe45050Locked|r"
	L.actionbars_unlocked = "Actionbars |cff50e468Unlocked|r"
end