<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <style>
.map_wrap, .map_wrap * {margin:0; padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap {position:relative;width:100%;height:350px;}
#category {position:absolute;top:10px;left:10px;border-radius: 5px; border:1px solid #909090;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);background: #fff;overflow: hidden;z-index: 2;}
#category li {float:left;list-style: none;width:50px;px;border-right:1px solid #acacac;padding:6px 0;text-align: center; cursor: pointer;}
#category li.on {background: #eee;}
#category li:hover {background: #ffe6e6;border-left:1px solid #acacac;margin-left: -1px;}
#category li:last-child{margin-right:0;border-right:0;}
#category li span {display: block;margin:0 auto 3px;width:27px;height: 28px;}
#category li .category_bg {background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png) no-repeat;}
#category li .sleepArea {background-position: -10px 0;}
#category li .mart {background-position: -10px -36px;}
#category li .pharmacy {background-position: -10px -72px;}
#category li .subway {background-position: -10px -108px;}
#category li .cafe {background-position: -10px -144px;}
#category li .store {background-position: -10px -180px;}
#category li.on .category_bg {background-position-x:-46px;}
.placeinfo_wrap {position:absolute;bottom:28px;left:-150px;width:300px;}
.placeinfo {position:relative;width:100%;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;padding-bottom: 10px;background: #fff;}
.placeinfo:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.placeinfo_wrap .after {content:'';position:relative;margin-left:-12px;left:50%;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
.placeinfo a, .placeinfo a:hover, .placeinfo a:active{color:#fff;text-decoration: none;}
.placeinfo a, .placeinfo span {display: block;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
.placeinfo span {margin:5px 5px 0 5px;cursor: default;font-size:13px;}
.placeinfo .title {font-weight: bold; font-size:14px;border-radius: 6px 6px 0 0;margin: -1px -1px 0 -1px;padding:10px; color: #fff;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.placeinfo .tel {color:#0f7833;}
.placeinfo .jibun {color:#999;font-size:11px;margin-top:0;}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회사소개</title>
<link rel="stylesheet" type="text/css" href="resources/css/company.css" />
<link rel="stylesheet" type="text/css" href="resources/css/main.css" />
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f3e1b7156e65df896b6e836e9252e216&libraries=services"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>


	<!-- Swiper JS -->	<script type="text/javascript" src="resources/controller/js/sub/company.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.js"></script>
</head>
<body>
	<div id="company_header">
	</div>
	<div id="company_title">
		<div id="company_img_cut">
			<img src="/" onerror="this.src ='https://mblogthumb-phinf.pstatic.net/20150403_86/e2voo_14280514283502gas9_JPEG/kakako-00.jpg?type=w800'">
		</div>
		<div id="word">
			<h3>EG Company</h3><br>
			<p>은경컴퍼니</p><br>

			<p>은경소프트는 21세기를 선도하는 게임 종합 커뮤니티 사이트입니다</p><br>
			<p>2020년 설립되었으며 직원수 3명의 신생 기업입니다.</p>
			<button type="button" onclick="onStageHere()">현위치</button>
		</div>
	</div>

	<div id="">
		<div id="container" class="view_map">
			<div id="mapWrapper"
				style="width: 100%; height: 100%; position: relative;">
				<div id="map" style="width: 100%; height: 100%;">
						<div class="map_wrap">
						    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
						    <ul id="category">
						        <li id="CS2" data-order="0"> 
						            <span class="category_bg sleepArea"></span>
						            편의점
						        </li>       
						        <li id="MT1" data-order="1"> 
						            <span class="category_bg mart"></span>
						            마트
						        </li>  
						        <li id="PM9" data-order="2"> 
						            <span class="category_bg pharmacy"></span>
						            약국
						        </li>  
						        <li id="SW8" data-order="3"> 
						            <span class="category_bg subway"></span>
						            지하철역
						        </li>  
						        <li id="CE7" data-order="4"> 
						            <span class="category_bg cafe"></span>
						            카페
						        </li>  
						        <li id="FD6" data-order="5"> 
						            <span class="category_bg store"></span>
						            음식점
						        </li>      
						    </ul>
						    
						</div>
				</div>
				

			</div>
			<div id="rvWrapper"
				style="width: 100%; height: 100%; position: absolute; top: 0; left: 0;">
				<div id="roadview" style="height: 100%;"></div>
				<!-- 로드뷰를 표시할 div 입니다 -->
				<input type="button" id="btnMap" onclick="toggleMap(true)"
					title="지도 보기" value="지도">
			</div>
		</div>
	</div>
	<div id="d_section">
		<div class="title">
			<h1>은경컴퍼니 개발자 소개</h1>
			<p>각 분야 개발자를 소개합니다</p>
		</div>

		<div class="dev">
			<div class="user_img_cut">
				<img src="" onerror="">
			</div>
			<div class="user_info">
				<div class="info_title">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-person-lines-fill"
						viewBox="0 0 16 16">
				  <path
							d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm-5 6s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zM11 3.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm.5 2.5a.5.5 0 0 0 0 1h4a.5.5 0 0 0 0-1h-4zm2 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2zm0 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2z" />
				</svg>
					<h3>김은택</h3>
					<p>프론트엔드 개발자</p>
				</div>
				<p>
					<b>주요이력</b>
				</p>
				<p>- 한국성서대학교 졸업</p>
				<p>- 플랫폼레인 인턴</p>
				<p>- 주요 프로젝트 : 영화 추천 사이트, 여행지 추천 사이트</p>
			</div>

			<div class="bottom">
				<div class="git">
					<p>
						<b>github : <a href="#">www.github.com</a></b>
					</p>
					<p>
						<b>project site : <a href="#">http://</a></b>
					</p>
				</div>
			</div>
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
				fill="currentColor" class="bi bi-arrow-down-short"
				viewBox="0 0 16 16">
		  <path fill-rule="evenodd"
					d="M8 4a.5.5 0 0 1 .5.5v5.793l2.146-2.147a.5.5 0 0 1 .708.708l-3 3a.5.5 0 0 1-.708 0l-3-3a.5.5 0 1 1 .708-.708L7.5 10.293V4.5A.5.5 0 0 1 8 4z" />
		</svg>
		</div>

		<div class="dev">
			<div class="user_img_cut">
				<img src="" onerror="">
			</div>
			<div class="user_info">
				<div class="info_title">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-person-lines-fill"
						viewBox="0 0 16 16">
				  <path
							d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm-5 6s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zM11 3.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm.5 2.5a.5.5 0 0 0 0 1h4a.5.5 0 0 0 0-1h-4zm2 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2zm0 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2z" />
				</svg>
					<h3>김재훈</h3>
					<p>백엔드 개발자</p>
				</div>
				<p>
					<b>주요이력</b>
				</p>
				<p>- 한국성서대학교 졸업</p>
				<p>- 서울쭈꾸미 녹번점 지점장</p>
				<p>- 주요 프로젝트 : 영화 추천 사이트, 여행지 추천 사이트, 하둡 프로젝트</p>
			</div>
			<div class="bottom">
				<div class="git">
					<p>
						<b>github : <a href="#">www.github.com</a></b>
					</p>
					<p>
						<b>project site : <a href="#">http://winbo121.cafe24.com/Movie_web/intro</a></b>
					</p>
				</div>
			</div>
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
				fill="currentColor" class="bi bi-arrow-down-short"
				viewBox="0 0 16 16">
		  <path fill-rule="evenodd"
					d="M8 4a.5.5 0 0 1 .5.5v5.793l2.146-2.147a.5.5 0 0 1 .708.708l-3 3a.5.5 0 0 1-.708 0l-3-3a.5.5 0 1 1 .708-.708L7.5 10.293V4.5A.5.5 0 0 1 8 4z" />
		</svg>
		</div>

		<div class="dev">
			<div class="user_img_cut">
				<img src="" onerror="">
			</div>
			<div class="user_info">
				<div class="info_title">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-person-lines-fill"
						viewBox="0 0 16 16">
				  <path
							d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm-5 6s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zM11 3.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm.5 2.5a.5.5 0 0 0 0 1h4a.5.5 0 0 0 0-1h-4zm2 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2zm0 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2z" />
				</svg>
					<h3>안형모</h3>
					<p>백엔드 개발자</p>
				</div>
				<p>
					<b>주요이력</b>
				</p>
				<p>- 한국성서대학교 졸업</p>
				<p>- 주식회사 맥서브 인턴</p>
				<p>- 더퍼스트인베서트먼트 재직</p>
				<p>- 주요 프로젝트 : 지문인식 IoT 사물함, 우리아이 커뮤니티 제작</p>
			</div>
			<div class="bottom">
				<div class="git">
					<p>
						<b>github : <a href="#">www.github.com</a></b>
					</p>
					<p>
						<b>project site : <a href="#">www.github.com</a></b>
					</p>
				</div>
			</div>
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
				fill="currentColor" class="bi bi-arrow-down-short"
				viewBox="0 0 16 16">
		  <path fill-rule="evenodd"
					d="M8 4a.5.5 0 0 1 .5.5v5.793l2.146-2.147a.5.5 0 0 1 .708.708l-3 3a.5.5 0 0 1-.708 0l-3-3a.5.5 0 1 1 .708-.708L7.5 10.293V4.5A.5.5 0 0 1 8 4z" />
		</svg>
		</div>
	</div>

	<!-- 푸터  -->
	<footer class="footer">
		
	</footer>

	<script type="text/javascript">
			// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
			var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), 
		    contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
		    markers = [], // 마커를 담을 배열입니다
		    currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
		
		
			var container = document.getElementById('map');
			var options = {
				center: new kakao.maps.LatLng(33.450701, 126.570667),
				level: 3
			};
		
			var map = new kakao.maps.Map(container, options);
			
			// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
			var mapTypeControl = new kakao.maps.MapTypeControl();
		
			// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
			// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
			map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
		
			// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
			var zoomControl = new kakao.maps.ZoomControl();
			map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
			onStageHere();
			function onStageHere(){
					if (navigator.geolocation) {
					    
					    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
					    navigator.geolocation.getCurrentPosition(function(position) {
					        
					        var lat = position.coords.latitude, // 위도
					            lon = position.coords.longitude; // 경도
					        
					        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
					            message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
					        
					        // 마커와 인포윈도우를 표시합니다
					        displayMarker(locPosition, message);
					            
					      });
					    
					} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
					    
					    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
					        message = 'geolocation을 사용할수 없어요..'
					        
					    displayMarker(locPosition, message);
					}
			}
			function displayMarker(locPosition, message) {
		
			    // 마커를 생성합니다
			    var marker = new kakao.maps.Marker({  
			        map: map, 
			        position: locPosition
			    }); 
			    
			    var iwContent = message, // 인포윈도우에 표시할 내용
			        iwRemoveable = true;
		
			    // 인포윈도우를 생성합니다
			    var infowindow = new kakao.maps.InfoWindow({
			        content : iwContent,
			        removable : iwRemoveable
			    });
			    
			    // 인포윈도우를 마커위에 표시합니다 
			    infowindow.open(map, marker);
			    
			    // 지도 중심좌표를 접속위치로 변경합니다
			    map.setCenter(locPosition);      
			}    
			
			
			// 장소 검색 객체를 생성합니다
			var ps = new kakao.maps.services.Places(map); 
		
			// 지도에 idle 이벤트를 등록합니다
			kakao.maps.event.addListener(map, 'idle', searchPlaces);
		
			// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
			contentNode.className = 'placeinfo_wrap';
		
			// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
			// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 
			addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
			addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);
		
			// 커스텀 오버레이 컨텐츠를 설정합니다
			placeOverlay.setContent(contentNode);  
		
			// 각 카테고리에 클릭 이벤트를 등록합니다
			addCategoryClickEvent();
		
			// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
			function addEventHandle(target, type, callback) {
			    if (target.addEventListener) {
			        target.addEventListener(type, callback);
			    } else {
			        target.attachEvent('on' + type, callback);
			    }
			}
		
			// 카테고리 검색을 요청하는 함수입니다
			function searchPlaces() {
			    if (!currCategory) {
			        return;
			    }
			    
			    // 커스텀 오버레이를 숨깁니다 
			    placeOverlay.setMap(null);
		
			    // 지도에 표시되고 있는 마커를 제거합니다
			    removeMarker();
			    
			    ps.categorySearch(currCategory, placesSearchCB, {useMapBounds:true}); 
			}
		
			// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
			function placesSearchCB(data, status, pagination) {
			    if (status === kakao.maps.services.Status.OK) {
		
			        // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
			        displayPlaces(data);
			    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
			        // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요
		
			    } else if (status === kakao.maps.services.Status.ERROR) {
			        // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
			        
			    }
			}
		
			// 지도에 마커를 표출하는 함수입니다
			function displayPlaces(places) {
		
			    // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
			    // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
			    var order = document.getElementById(currCategory).getAttribute('data-order');
		
			    
		
			    for ( var i=0; i<places.length; i++ ) {
		
			            // 마커를 생성하고 지도에 표시합니다
			            var marker = addMarker(new kakao.maps.LatLng(places[i].y, places[i].x), order);
		
			            // 마커와 검색결과 항목을 클릭 했을 때
			            // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
			            (function(marker, place) {
			                kakao.maps.event.addListener(marker, 'click', function() {
			                    displayPlaceInfo(place);
			                });
			            })(marker, places[i]);
			    }
			}
		
			// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
			function addMarker(position, order) {
			    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
			        imageSize = new kakao.maps.Size(27, 28),  // 마커 이미지의 크기
			        imgOptions =  {
			            spriteSize : new kakao.maps.Size(72, 208), // 스프라이트 이미지의 크기
			            spriteOrigin : new kakao.maps.Point(46, (order*36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
			            offset: new kakao.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
			        },
			        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
			            marker = new kakao.maps.Marker({
			            position: position, // 마커의 위치
			            image: markerImage 
			        });
		
			    marker.setMap(map); // 지도 위에 마커를 표출합니다
			    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
		
			    return marker;
			}
		
			// 지도 위에 표시되고 있는 마커를 모두 제거합니다
			function removeMarker() {
			    for ( var i = 0; i < markers.length; i++ ) {
			        markers[i].setMap(null);
			    }   
			    markers = [];
			}
		
			// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
			function displayPlaceInfo (place) {
			    var content = '<div class="placeinfo">' +
			                    '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';   
		
			    if (place.road_address_name) {
			        content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
			                    '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
			    }  else {
			        content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
			    }                
			   
			    content += '    <span class="tel">' + place.phone + '</span>' + 
			                '</div>' + 
			                '<div class="after"></div>';
		
			    contentNode.innerHTML = content;
			    placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
			    placeOverlay.setMap(map);  
			}
		
		
			// 각 카테고리에 클릭 이벤트를 등록합니다
			function addCategoryClickEvent() {
			    var category = document.getElementById('category'),
			        children = category.children;
		
			    for (var i=0; i<children.length; i++) {
			        children[i].onclick = onClickCategory;
			    }
			}
		
			// 카테고리를 클릭했을 때 호출되는 함수입니다
			function onClickCategory() {
			    var id = this.id,
			        className = this.className;
		
			    placeOverlay.setMap(null);
		
			    if (className === 'on') {
			        currCategory = '';
			        changeCategoryClass();
			        removeMarker();
			    } else {
			        currCategory = id;
			        changeCategoryClass(this);
			        searchPlaces();
			    }
			}
		
			// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
			function changeCategoryClass(el) {
			    var category = document.getElementById('category'),
			        children = category.children,
			        i;
		
			    for ( i=0; i<children.length; i++ ) {
			        children[i].className = '';
			    }
		
			    if (el) {
			        el.className = 'on';
			    } 
			} 
	</script>

</body>
</html>