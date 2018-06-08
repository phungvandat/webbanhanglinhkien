<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Untitled Document</title>
<script language="JavaScript1.1">
<!--

//Pixelating Image slideshow
//Copyright Dynamic Drive 2001
//Visit http://www.dynamicdrive.com for this script

//specify interval between slide (in mili seconds)
var slidespeed=3000
//specify images
var slideimages=new Array("h1.jpg","h2.jpg","h3.jpg","h4.jpg","h5.jpg")
//specify corresponding links
var slidelinks=new Array("http://www.dynamicdrive.com","http://wsabstract.com","http://www.geocities.com")

var imageholder=new Array()
var ie55=window.createPopup
for (i=0;i<slideimages.length;i++){
imageholder[i]=new Image()
imageholder[i].src=slideimages[i]
}

function gotoshow(){
window.location=slidelinks[whichlink]
}

//-->
</script>
</head>

<body>
<a href="javascript:gotoshow()"><img src="photo1.jpg" name="slide" border=0 style="filter:progid:DXImageTransform.Microsoft.Pixelate(MaxSquare=15,Duration=1)"></a>

<script language="JavaScript1.1">
<!--
var whichlink=0
var whichimage=0
var pixeldelay=(ie55)? document.images.slide.filters[0].duration*1000 : 0
function slideit(){
if (!document.images) return
if (ie55) document.images.slide.filters[0].apply()
document.images.slide.src=imageholder[whichimage].src
if (ie55) document.images.slide.filters[0].play()
whichlink=whichimage
whichimage=(whichimage<slideimages.length-1)? whichimage+1 : 0
setTimeout("slideit()",slidespeed+pixeldelay)
}
slideit()

//-->
</script>

</body>
</html>