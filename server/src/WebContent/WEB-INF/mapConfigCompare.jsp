<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<script>
	$(function() {
		check=false;
		$(".check").button();
		$(".format").buttonset();
		$( "label" ).tooltip();
		$( "#compare").button();
		$(".help").tooltip();
		$("#inter").hide();
		$("#circleG").hide();
		$(".date").timepicker({
			timeFormat: 'HH:mm:ss',
			hourMax: 99
		});
		var condition = "?";
		$( "#submit" )
	      .button()
	      .click(function( event ) {
	    	var condition = "?config=compare&";  
	    	$('.format:first>input').each(function(i){
	    		if($(this).is(':checked'))
	    			condition+=$(this).attr('table')+"="+$(this).attr('id').substring(3, $(this).attr('id').length)+"&";
	    	});
	    	$(".date").each(function(i){
	    		if($(this).val()!="")
	    			condition+=$(this).attr('name')+"="+$(this).val()+"&";
	    	});
/* 	      	$(function(){
	      		if($('#interval').val()!=""){
	      			condition+='interval='+$('#interval').val()+"&";
	      		}
	      	}); */
	    	<%--if ( $('input[id=check11]').is(':checked')){
	    		console.log("Test ok");
	    	}
	        event.preventDefault();--%>
	        $(this).attr('href', condition);
	        $("#circleG").show();
	      });
	});
</script>

</head>
<body>
	
	<p>
	Measures :
	<div class="format">
	<c:forEach var="i" items="${listExp}">
		<input class="check" type="checkbox" id="exp${i.id}" table="experiment"><label title="${fn:escapeXml(i.description)}" for="exp${i.id}">${fn:escapeXml(i.comments)}</label>
	</c:forEach>
	</div>
	</p>
	<p>Select date : <br/>
		Begin : <input type="text" name="date" class="date" value="" />
		End : <input type="text" name="dateEnd" class="date" value="" />		
	</p>
<!-- 	<p>
	Specify research interval (in seconds) :  
		<input type="text" name="interval" value="" id="interval" />
	<br/> <b> Note : </b> If there isn't value for a mote in this interval, no color will appear around this one.
	</p> -->
	<p>
	<a href="" title="Submit" id="submit">Submit</a>
	</p>
	 <div id="circleG">
<div id="circleG_1" class="circleG">
</div>
<div id="circleG_2" class="circleG">
</div>
<div id="circleG_3" class="circleG">
</div>
</div>
