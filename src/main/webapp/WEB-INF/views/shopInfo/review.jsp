<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.reviewName, .reviewStar, .reviewDate{
		  display: inline-block;
		  width: 150px;
	}
	/* .reviewStar{
		  display: inline-block;
		  width: 150px;
	} */
	.reviewDate{
		text-align: right;	
		float: right;
	}
</style>
<script>
var ddData = [
    {
        text: "Facebook",
        value: 1,
        selected: false,
        description: "Description with Facebook",
        imageSrc: "http://i.imgur.com/XkuTj3B.png"
    },
    {
        text: "Twitter",
        value: 2,
        selected: false,
        description: "Description with Twitter",
        imageSrc: "http://i.imgur.com/8ScLNnk.png"
    },
    {
        text: "LinkedIn",
        value: 3,
        selected: true,
        description: "Description with LinkedIn",
        imageSrc: "http://i.imgur.com/aDNdibj.png"
    },
    {
        text: "Foursquare",
        value: 4,
        selected: false,
        description: "Description with Foursquare",
        imageSrc: "http://i.imgur.com/kFAk2DX.png"
    }
];

$(function(){
	$('#demoBasic').ddslick({
	    data: ddData,
	    width: 300,
	    imagePosition: "left",
	    selectText: "Select your favorite social network",
	    onSelected: function (data) {
	        console.log(data);
	    }
	});
	
})
</script>
</head>
<body>
	<div id="reviewContextBox">
		<div>
		<select>
		<option title="/beaudafest/resources/testimg/별5.png" value="5">별별별별별</option>
		<option title="/beaudafest/resources/testimg/별4.png" value="4">별별별별무</option>
		<option title="/beaudafest/resources/testimg/별3.png" value="3">별별별무무</option>
		<option title="/beaudafest/resources/testimg/별2.png" value="2">별별무무무</option>
		<option title="/beaudafest/resources/testimg/별1.png" value="1">별무무무무</option>
		</select>
		</div>
		<div style="display:inline-block;vertical-align:text-top;">
			<div style="display:inline-block;"><textarea rows="4" cols="50" placeholder="comment"></textarea></div><div style="display:inline-block;"><button>작성</button></div>
		</div>	
	</div>
	<div id="reviewList">
	<div>
		<div class="reviewName">Jongsoo</div><div class="reviewStar">별 별 별 별 별</div><div class="reviewDate">2019/09/20</div>
		<hr>
		<div>
		<p>독창적인 디자인이 너무 좋아요</p>
		</div>
	</div>
	<div>
		<div class="reviewName">hana</div><div class="reviewStar">별 별 별 별 별</div><div class="reviewDate">2019/09/20</div>
		<hr>
		<div>
		<p>디자인이 이쁘고 서비스도 너무 훌륭해요</p>
		</div>
	</div>
	<div>
		<div class="reviewName">yunajo</div><div class="reviewStar">별 별 별 별 별</div><div class="reviewDate">2019/09/20</div>
		<hr>
		<div>
		<p>디자인이 이쁘고 서비스도 꽤 훌륭해요</p>
		</div>
	</div>
	</div>
</body>
</html>