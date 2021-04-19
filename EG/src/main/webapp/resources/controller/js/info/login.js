
//사용할 앱의 JavaScript 키를 설정해 주세요.
		Kakao.init('871b0eb9671cfa50ca537573d9a6da87');

		function loginWithKakao() {
			Kakao.Auth.login({
				success : function(authObj) {
					// 로그인 성공시, API를 호출합니다.
					Kakao.API
							.request({
								url : '/v2/user/me',
								success : function(res) {
									console.log(res);
									
									var Image = res.kakao_account.profile.profile_image_url; // 카카오 유저 프로필
									var userEmail = res.kakao_account.email; //카카오 유저의 이메일
									var userName = res.properties.nickname; //카카오 유저가 등록한 별명(이름)
									
									
				},
				fail : function(error) {
					alert(JSON.stringify(error));
				}
			});
		},
		fail : function(err) {
			alert(JSON.stringify(err));
			}
		})
	}