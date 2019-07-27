var expertFindService = (function(){
	
	function getList(data, callback, error){
		console.log("get expert...........");
		
		var sido = data.sido;
		var gugun = data.gugun;
		var ser = data.ser;
		var serviceInfo = data.serviceInfo;
		
		console.log(sido + " " + gugun + " " + ser + " " + serviceInfo);
		$.getJSON("/expert/list/"+sido+"/"+gugun+"/"+ser+"/"+serviceInfo , function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
	
	return{
		getList:getList
	};
})();

$('document').ready(function(){
	var sel_sido="";
	var sel_sido_idx="";
	var sel_cate="";
	var sel_cate_idx="";
	
			var area0 = [{item:'지역 전체'}, {item:'서울특별시'}, {item:"인천광역시"}, {item:"대전광역시"}, {item:"광주광역시"},
				{item:"대구광역시"}, {item:"울산광역시"}, {item:"부산광역시"}, {item:"경기도"}, {item:"강원도"}, {item:"충청북도"}, {item:"충청남도"},
				{item:"전라북도"}, {item:"전라남도"}, {item:"경상북도"}, {item:"경상남도"}, {item:"제주도"} ];
			var area1 = [{item:'전체'}, {item:"강남구"}, {item:"강동구"}, {item:"강북구"}, {item:"강서구"}, {item:"관악구"}, {item:"광진구"}, {item:"구로구"},
				{item:"금천구"}, {item:"노원구"}, {item:"도봉구"}, {item:"동대문구"}, {item:"동작구"}, {item:"마포구"}, {item:"서대문구"}, {item:"서초구"},
				{item:"성동구"}, {item:"성북구"}, {item:"송파구"}, {item:"양천구"}, {item:"영등포구"}, {item:"용산구"}, {item:"은평구"}, {item:"종로구"},
				{item:"중구"}, {item:"중랑구"} ];			
			var area2 = [{item:'전체'}, {item:"계양구"}, {item:"남구"}, {item:"남동구"}, {item:"동구"}, {item:"부평구"}, {item:"서구"}, {item:"연수구"}, {item:"중구"},
				{item:"강화군"}, {item:"옹진군"} ];
			var area3 = [{item:'전체'}, {item:"대덕구"}, {item:"동구"}, {item:"서구"}, {item:"유성구"}, {item:"중구"} ];
			var area4 = [{item:'전체'},{item:"광산구"}, {item:"남구"}, {item:"동구"}, {item:"북구"}, {item:"서구"} ];
			var area5 = [{item:'전체'}, {item:"남구"}, {item:"달서구"}, {item:"동구"}, {item:"북구"}, {item:"서구"}, {item:"수성구"}, {item:"중구"}, {item:"달성군"} ];
			var area6 = [{item: "남구"}, {item:"동구"}, {item:"북구"}, {item:"중구"}, {item:"울주군"} ];
			var area7 = [{item:'전체'}, {item:"강서구"}, {item:"금정구"}, {item:"남구"}, {item:"동구"}, {item:"동래구"}, {item:"부산진구"}, {item:"북구"}, {item:"사상구"},
				{item:"사하구"}, {item:"서구"}, {item:"수영구"}, {item:"연제구"}, {item:"영도구"}, {item:"중구"}, {item:"해운대구"}, {item:"기장군"} ];
			var area8 = [{item:'전체'},{item: "고양시"}, {item:"과천시"}, {item:"광명시"}, {item:"광주시"}, {item:"구리시"}, {item:"군포시"}, {item:"김포시"},
				{item:"남양주시"}, {item:"동두천시"}, {item:"부천시"}, {item:"성남시"}, {item:"수원시"}, {item:"시흥시"}, {item:"안산시"}, {item:"안성시"},
				{item:"안양시"}, {item:"양주시"}, {item:"오산시"}, {item:"용인시"}, {item:"의왕시"}, {item:"의정부시"}, {item:"이천시"}, {item:"파주시"},
				{item:"평택시"}, {item:"포천시"}, {item:"하남시"}, {item:"화성시"}, {item:"가평군"}, {item:"양평군"}, {item:"여주군"}, {item:"연천군"} ];
			var area9 = [{item:'전체'}, {item:"강릉시"}, {item:"동해시"}, {item:"삼척시"}, {item:"속초시"}, {item:"원주시"}, {item:"춘천시"}, {item:"태백시"},
				{item:"고성군"}, {item:"양구군"}, {item:"양양군"}, {item:"영월군"}, {item:"인제군"}, {item:"정선군"}, {item:"철원군"}, {item:"평창군"},
				{item:"홍천군"}, {item:"화천군"}, {item:"횡성군"} ];
			var area10 = [{item:'전체'}, {item:"제천시"}, {item:"청주시"}, {item:"충주시"}, {item:"괴산군"}, {item:"단양군"}, {item:"보은군"}, {item:"영동군"},
				{item:"옥천군"}, {item:"음성군"}, {item:"증평군"}, {item:"진천군"}, {item:"청원군"} ];
			var area11 = [{item:'전체'}, {item:"계룡시"}, {item:"공주시"}, {item:"논산시"}, {item:"보령시"}, {item:"서산시"}, {item:"아산시"}, {item:"천안시"},
				{item:"금산군"}, {item:"당진군"}, {item:"부여군"}, {item:"서천군"}, {item:"연기군"}, {item:"예산군"}, {item:"청양군"}, {item:"태안군"},{item:"홍성군"} ];
			var area12 = [{item:'전체'}, {item:"군산시"}, {item:"김제시"}, {item:"남원시"}, {item:"익산시"}, {item:"전주시"}, {item:"정읍시"}, {item:"고창군"},
				{item:"무주군"}, {item:"부안군"}, {item:"순창군"}, {item:"완주군"}, {item:"임실군"}, {item:"장수군"}, {item:"진안군"} ];
			var area13 = [{item:'전체'},{item: "광양시"}, {item:"나주시"}, {item:"목포시"}, {item:"순천시"}, {item:"여수시"}, {item:"강진군"}, {item:"고흥군"},
				{item:"곡성군"}, {item:"구례군"}, {item:"담양군"}, {item:"무안군"}, {item:"보성군"}, {item:"신안군"}, {item:"영광군"}, {item:"영암군"},
				{item:"완도군"}, {item:"장성군"}, {item:"장흥군"}, {item:"진도군"}, {item:"함평군"}, {item:"해남군"}, {item:"화순군"} ];
			var area14 = [{item:'전체'}, {item:"경산시"}, {item:"경주시"}, {item:"구미시"}, {item:"김천시"}, {item:"문경시"}, {item:"상주시"}, {item:"안동시"},
				{item:"영주시"}, {item:"영천시"}, {item:"포항시"}, {item:"고령군"}, {item:"군위군"}, {item:"봉화군"}, {item:"성주군"}, {item:"영덕군"},
				{item:"영양군"}, {item:"예천군"}, {item:"울릉군"}, {item:"울진군"}, {item:"의성군"}, {item:"청도군"}, {item:"청송군"}, {item:"칠곡군"} ];
			var area15 = [{item:'전체'},{item: "거제시"}, {item:"김해시"}, {item:"마산시"}, {item:"밀양시"}, {item:"사천시"}, {item:"양산시"}, {item:"진주시"},
				{item:"진해시"}, {item:"창원시"}, {item:"통영시"}, {item:"거창군"}, {item:"고성군"}, {item:"남해군"}, {item:"산청군"}, {item:"의령군"},
				{item:"창녕군"}, {item:"하동군"}, {item:"함안군"}, {item:"함양군"}, {item:"합천군"} ];
			var area16 = [{item:'전체'}, {item:"서귀포시"}, {item:"제주시"}, {item:"남제주군"}, {item:"북제주군"} ];

			var cate0 = [{item:'분야 전체'}, {item:'레슨'}, {item:'홈/리빙'}, {item: '이벤트'}, {item: '디자인/개발'}, {item: '건강/미용'}];
			
			var cate1 = [{item:'전체'}, {item:'영어 과외'}, {item:'수학 과외'}, {item:'과학 과외'}, {item:'논술 과외'}, {item:'검정고시 과외'}, {item:'중국어 과외'},
						 {item:'전화영어 회화'}, {item:'스페인어 과외'}, {item:'프랑스어 과외'}, {item:'PT'}, {item:'크로스핏'}, {item:'필라테스'}, {item:'수영 레슨'}, 
						 {item:'테니스 레슨'}, {item:'스키 강습'}, {item:'서핑 강습'}, {item:'피아노 레슨'}, {item:'드럼 레슨'}, {item:'바이올린 레슨'}, {item:'클라리넷 레슨'}, 
						 {item:'플룻 레슨'}, {item:'요리 레슨'}, {item:'베이킹 레슨'}, {item:'와인 레슨'}, {item:'커피 레슨'}, {item:'칵테일 레슨'}, {item:'보컬 레슨'}, 
						 {item:'랩 레슨'}, {item:'디제잉 레슨'}, {item:'작곡 레슨'}, {item: '성악 레슨'}, {item: '비트박스 레슨'}];
			
			var cate2 = [{item:'전체'}, {item:'국내 이사'}, {item:'원룹/소형 이사'}, {item:'가정 이사'}, {item:'사무실 이사'}, {item:'용달 운송'}, {item:'해외 이사'},
				 {item:'사무실 청소 업체'}, {item:'거주 청소 업체'}, {item:'가전제품 청소'}, {item:'곰팡이 제거'}, {item:'해충방역'}, {item:'출장 세차'}, {item:'집 인테리어'}, 
				 {item:'상업공간 인테리어'}, {item:'주방 리모델링'}, {item:'도배 장판 시공'}, {item:'나노코팅 시공'}, {item:'바닥재 시공'}, {item:'집 청소 도우미'}, {item:'육아 도우미'}, 
				 {item:'요리 도우미'}, {item:'간병 도우미'}, {item:'산후 도우미'}, {item:'실버 도우미'}, {item:'단열필름 시공'}, {item:'방충망 설치 및 수리'}, {item:'방범창 설치 및 수리'}, 
				 {item:'도어락 설치 및 수리'}, {item:'문 설치 및 수리'}, {item:'샷시 설치 및 수리'}];
			
			var cate3 = [{item:'전체'}, {item:'축가 요청'}, {item:'결혼식 사회자'}, {item:'주례'}, {item:'웨딩 사진 촬영'}, {item:'스드메/웨딩플래너'}, {item:'웨딩홀 대관'},
				 {item:'웨딩 연주'}, {item:'웨딩 케이크'}, {item:'웨딩 케이터링'}, {item:'한복'}, {item:'행사 MC'}, {item:'밴드 공연'}, {item:'보컬 공연'}, 
				 {item:'DJ 공연'}, {item:'댄스 공연'}, {item:'클래식 공연'}, {item:'국악 공연'}, {item:'마술 공연'}, {item:'삐에로/행사도우미'}, {item:'샌드아트 행사'}, 
				 {item:'개인용 사진 촬영'}, {item:'기업/상업용 사진 촬영'}, {item:'개인용 영상 촬영'}, {item:'기업/상업용 영상 촬영'}, {item:'스냅 촬영'}, {item:'드론 촬영'}, {item:'영상 편집'}, 
				 {item:'요리 도우미'}, {item:'푸드트럭/밥차'}, {item:'맞춤 케이크'}];
			
			var cate4 = [{item:'전체'}, {item:'전체'}, {item:'전체'}, {item:'전체'}, {item:'전체'}, {item:'전체'}, {item:'전체'},
				 {item:'전체'}, {item:'전체'}, {item:'전체'}, {item:'전체'}, {item:'전체'}, {item:'전체'}, {item:'전체'}, 
				 {item:'전체'}, {item:'전체'}, {item:'전체'}, {item:'전체'}, {item:'전체'}, {item:'전체'}, {item:'전체'}, 
				 {item:'전체'}, {item:'전체'}, {item:'전체'}, {item:'전체'}, {item:'전체'}, {item:'전체'}, {item:'전체'}, 
				 {item:'전체'}, {item:'전체'}, {item:'전체'}];
			
			var cate5 = [{item:'전체'}, {item:'전체'}, {item:'전체'}, {item:'전체'}, {item:'전체'}, {item:'전체'}, {item:'전체'},
				 {item:'전체'}, {item:'전체'}, {item:'전체'}, {item:'전체'}, {item:'전체'}, {item:'전체'}, {item:'전체'}, 
				 {item:'전체'}, {item:'전체'}, {item:'전체'}, {item:'전체'}, {item:'전체'}, {item:'전체'}, {item:'전체'}, 
				 {item:'전체'}, {item:'전체'}, {item:'전체'}, {item:'전체'}, {item:'전체'}, {item:'전체'}, {item:'전체'}, 
				 {item:'전체'}, {item:'전체'}, {item:'전체'}];
			
			// 시/도 선택 박스 초기화
			$.each(area0, function(index, data){
				var html= '<option name="sel_sido" value="' + data.item + '" >'+ data.item +' </option>'
				$("#sido").append(html);
			});

			$('#sido').change(function(){
				sel_sido = $('#sido').val();
				
				if(sel_sido != "지역 전체"){
					$('#gugun').show();
				}
				else if(sel_sido == "지역 전체"){
					$('#gugun').empty();
					$('#gugun').hide();
				}
				
				$.each(area0, function(index, data){
					if(sel_sido == data.item)
						sel_sido_idx = index;
				});
				
				var area = "area"+sel_sido_idx;
				
				$('#gugun').empty();

				$.each(eval(area), function(data){
					var html= '<option name="sel_gugun" value="' + this.item + '" >'+ this.item +' </option>'
				
					$("#gugun").append(html);
				});

			});			
			
			$.each(cate0, function(index, data){
				var html= '<option name="sel_cate" value="' + data.item + '" >'+ data.item +' </option>'
				$("#service").append(html);
			});
			
			$('#service').change(function(){				
				sel_cate = $('#service').val();
				
				if(sel_cate != "분야 전체"){
					$('#serviceInfo').show();
				}
				else if(sel_cate == "분야 전체"){
					$('#serviceInfo').empty();
					$('#serviceInfo').hide();
				}

				$.each(cate0, function(index, data){
					if(sel_cate == data.item)
						sel_cate_idx = index;
				});
				

				var cate = "cate"+sel_cate_idx;
				$('#serviceInfo').empty();
					
				$.each(eval(cate), function(data){
					var html= '<option name="sel_cate" value="' + this.item + '" >'+ this.item +' </option>'
				
					$("#serviceInfo").append(html);
				});

			});			
			
})	