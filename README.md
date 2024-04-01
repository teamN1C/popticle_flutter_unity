# 플러터 - 유니티 연동 프로젝트

<p>
<img src="https://github.com/teamN1C/popticle_flutter_unity/assets/118543824/c6675387-1326-44e6-8112-8f05b60548db" />
<em>다중사용자 환경에서 다른 사용자가 그린 그림을 확인할 수 있다.</em>  
</p>
<p>
<img src="https://github.com/teamN1C/popticle_flutter_unity/assets/118543824/616b9e20-7943-4789-9cb4-8fde11b7fd74" />
<em>텍스트를 남겨 다른 사용자가 볼 수 있다</em>  
</p>

- 이 프로젝트는 멀티 환경에서 여러 유저가 AR 그림, 텍스트를 이용하는 프로젝트입니다.
- 현실을 배경으로 AR 오브젝트를 남기고 다른 유저가 이 오브젝트와 상호작용하는 것을 목표로 하였습니다.

## 아키텍처
<a href="https://imgbb.com/"><img src="https://i.ibb.co/6g33Y21/image.png" alt="image" border="0"></a>
- 유니티 - AR구현, 멀티 서버
- 플러터 - 로그인과 UI 인터페이스
- 파이어베이스 - 회원관리와 서버로그 
- 저는 유니티-플러터 연동, 멀티 데디케이션 서버와 파이어베이스 구현을 맡아서 프로젝트를 진행하였습니다.

## 프로젝트 내용
<p>
<img src="https://github.com/teamN1C/popticle_flutter_unity/assets/118543824/dc4e89d3-cbf3-4f1b-8335-884bdf1fd839" />
<em>전반적인 프로젝트 흐름입니다.</em>  
</p>
<p>
<img src="https://github.com/teamN1C/popticle_flutter_unity/assets/118543824/8e04297c-6652-493c-8af6-8246ff0d4cb7" />
<em>firebase auth를 이용해서 로그인을 구현하였습니다. 로그인 화면은 플러터로 구성하였습니다.</em>  
</p>
<p>
<img src="https://github.com/teamN1C/popticle_flutter_unity/assets/118543824/17022633-5e0d-4218-a378-1a06214c30d7" />
<em>cloud functions v1을 이용해 스토리지와 ai server로 이미지를 전송하고 받는 서버리스 환경을 구축하였습니다.</em>  
</p>
<p>
<img src="https://github.com/teamN1C/popticle_flutter_unity/assets/118543824/c1a2df7e-76dc-425c-a9fc-853ff37e554a" />
<em> C#을 이용해서 유니티 라이브러리인 fishnet으로 멀티 데디케이션 서버를 구축하였습니다.</em>  
</p>
