<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
td.moreMenu {
   font-weight: bold;
}
</style>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
   $(document).ready(function() {
      $('td.moreMenu').hide();
      $('td.button').click(function() {
         $('td.moreMenu').toggle();

      });
   });
</script>

<h3 style="font-size: 20px; display: inline-block;">³ª·ç¹ğÅ© °èÁÂÁ¶È¸</h3>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<h3 style="font-size: 10px; display: inline-block;">
   <a href="<%=request.getContextPath()%>/openbanking/SelectOpenBanking"> ´Ù¸¥ÀºÇà °èÁÂÁ¶È¸</a>
</h3>
<h5>
   Á¶È¸±âÁØÀÏ½Ã:
   <script type="text/javascript">
      let today = new Date();
      let year = today.getFullYear();
      let month = today.getMonth();
      let date = today.getDate();
      let hours = today.getHours();
      let minutes = today.getMinutes();
      let seconds = today.getSeconds();
      document
            .write(
                  year + '.' + month + '.' + date + ' ' + hours + ':'
                        + minutes + ':' + seconds)
   </script>
</h5>
					<h1 class="cta-title">${member.member_name }°í°´´Ô</h1>
						<div class="cta-desc">
							<p>Describe the action here.</p>
							<p>Describe the action here.</p>
							<p>Describe the action here.</p>
						</div>
					</div>
					<div class="col-md-3 cta-button">
						<p>ÃÑ ÀÜ¾×</p>
						<h2>~~¿ø</h2>
					</div>
<h4>ÀÔÃâ±İ</h4>
<div
   style="border: 3px solid black; margin: 0px 10px 100px; width: 800;">
   <table class="w3-table-all" align="center">
      <tr class="w3-grey">
         <td align="center">ÀÔÃâ±İ (${count1 })°èÁÂ</td>
      </tr>
   </table>
   <c:if test="${count1 == 0 }">
      <table class="w3-table-all" align="center">
         <tr class="w3-grey">
            <td align="center" width="1000"><strong>ÀÔÃâ±İÅëÀå</strong> ¸¸µé ¶§ <br />ÀºÇà
               ¹æ¹® NO, ÀÌÁ¨ ¸ğ¹ÙÀÏ·Î ¼Õ¾È¿¡¼­ OK</br></td>
            <td width="100"><a
               href="<%=request.getContextPath()%>/finance/financeMain"> °³¼³ÇÏ±â</a></td>
         </tr>
      </table>
   </c:if>
   <c:if test="${count1 != 0 }">
      <table class="w3-table-all" align="center">
         <c:forEach var="article" items="${aaList}">
            <tr height="30">
               <td align="center" width="200">${article.account_name}</td>
               <td align="center" width="200">${article.account_num }</td>
               <td align="center" width="150">${article.account_alias }</td>
               <td align="center" width="150">ÀÜ¾× ${article.balance }¿ø</td>
               <td width="100"><a
                  href="<%=request.getContextPath() %>/account/accountShow?account_num=${article.account_num}">
                     Á¶È¸</a></td></tr>
               <td width="100"><a
                  href="<%=request.getContextPath()%>/transfer/TransferSelect"> ÀÌÃ¼</a></td>
               <td class="button" width="100">°èÁÂ°ü¸®</td>
               <tr height="30">
               <td class="moreMenu"><a href="URL"
                  onclick="window.open('<%=request.getContextPath()%>/account/aliasChange?account_num=${article.account_num}', '_blank', 'top=350px,left=350px,width=550px,height=390px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">°èÁÂ
                     º°¸í °ü¸®</a></td>
               <td class="moreMenu"><a href="URL"
                  onclick="window.open('<%=request.getContextPath()%>/account/accountCopy?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=700px,height=450px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
                     °èÁÂ°³¼³È®ÀÎ¼­(ÅëÀå»çº»)</a></td>
               <td class="moreMenu"><a href="URL"
                  onclick="window.open('<%=request.getContextPath()%>/account/accountPwChange?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=400px,height=250px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
                  °èÁÂºñ¹Ğ¹øÈ£º¯°æ</a></td>
               <td class="moreMenu"><a href="URL"
                  onclick="window.open('<%=request.getContextPath()%>/account/accountDelete?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=400px,height=250px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
                  °èÁÂÇØÁö</a></td>
            </tr>
         </c:forEach>
      </table>
   </c:if>
</div>

<h4>¿¹±İ</h4>
<div
   style="border: 3px solid black; margin: 0px 10px 100px; width: 800;">
   <c:if test="${count2 == 0 }">
      <table class="w3-table-all" align="center">
         <tr class="w3-grey">
            <td align="center" width="1000">Á¶È¸ ³»¿ªÀÌ ¾ø½À´Ï´Ù. </br> ÀçÅ×Å© °í¼ö´Â ³õÄ¡Áö ¾Ê´Â
               ¿¹±İÀÌÀÚ, ´Ü ÇÑ´ŞÀÌ¶óµµ ¿©À¯ÀÚ±İÀ» ¿¹±İ¿¡ ¸Ã°ÜµÎ¼¼¿ä.
            </td>
            <td width="100"><a
               href="<%=request.getContextPath()%>/finance/financeMain"> °¡ÀÔÇÏ±â</a></td>
         </tr>
      </table>
   </c:if>
   <c:if test="${count2 != 0 }">
      <table class="w3-table-all" align="center">
         <tr class="w3-grey">
            <td align="center">¿¹±İ (${count2 })°èÁÂ</td>
         </tr>
      </table>
      <table class="w3-table-all" align="center">
         <c:forEach var="article" items="${bbList}">
            <tr height="30">
               <td align="center" width="200">${article.account_name}</td>
               <td align="center" width="200">${article.account_num }</td>
               <td align="center" width="150">${article.account_alias }</td>
               <td align="center" width="150">ÀÜ¾× ${article.balance }¿ø</td>
              <td width="100"><a
                  href="<%=request.getContextPath() %>/account/accountShow?account_num=${article.account_num}">
                     Á¶È¸</a></td></tr>
               <td width="100"><a
                  href="<%=request.getContextPath()%>/transfer/TransferSelect"> ÀÌÃ¼</a></td>
               <td class="button" width="100">°èÁÂ°ü¸®</td>
               <tr height="30">
               <td class="moreMenu"><a href="URL"
                  onclick="window.open('<%=request.getContextPath()%>/account/aliasChange?account_num=${article.account_num}', '_blank', 'top=350px,left=350px,width=550px,height=390px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">°èÁÂ
                     º°¸í °ü¸®</a></td>
               <td class="moreMenu"><a href="URL"
                  onclick="window.open('<%=request.getContextPath()%>/account/accountCopy?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=700px,height=450px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
                     °èÁÂ°³¼³È®ÀÎ¼­(ÅëÀå»çº»)</a></td>
               <td class="moreMenu"><a href="URL"
                  onclick="window.open('<%=request.getContextPath()%>/account/accountPwChange?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=400px,height=250px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
                  °èÁÂºñ¹Ğ¹øÈ£º¯°æ</a></td>
               <td class="moreMenu"><a href="URL"
                  onclick="window.open('<%=request.getContextPath()%>/account/accountDelete?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=400px,height=250px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
                  °èÁÂÇØÁö</a></td>
            </tr>
         </c:forEach>
      </table>
   </c:if>
</div>

<<<<<<< HEAD
			<div class="bs-calltoaction bs-calltoaction-primary">
				<div class="row">
					<c:if test="${count1 == 0 }">
						<table class="w3-table-all" align="center">
							<tr class="w3-grey">
								<td align="center" width="1000"><strong>ì…ì¶œê¸ˆí†µì¥</strong> ë§Œë“¤ ë•Œ
									<br />ì€í–‰ ë°©ë¬¸ NO, ì´ì   ëª¨ë°”ì¼ë¡œ ì†ì•ˆì—ì„œ OK</br></td>
								<td width="100"><a
									href="<%=request.getContextPath()%>/finance/financeMain?dbno=1">
										ê°œì„¤í•˜ê¸°</a></td>
							</tr>
						</table>
					</c:if>
					<c:if test="${count1 != 0 }">
						<c:forEach var="article" items="${aaList}">
							<div class="col-md-9 cta-contents">
								<h1 class="cta-title">ì…ì¶œê¸ˆ</h1>
								<p>(${count1 })ê³„ì¢Œ</p>
								<div class="cta-desc">
									<p>${article.account_num }</p>
									<p>${article.account_name}</p>
									<p>${article.account_alias}</p>
								</div>
							</div>
							<div class="col-md-9 cta-contents">
								<h3>ì”ì•¡ ${article.balance }ì›</h3>
							</div>
							<div class="col-md-3 cta-button">
								<a
									href="<%=request.getContextPath() %>/account/accountShow?account_num=${article.account_num}"
									class="btn btn-lg btn-block btn-default">ì¡°íšŒ</a>
							</div>
							<div class="">
								<a href="<%=request.getContextPath()%>/transfer/TransferSelect"
									class="btn btn-lg btn-block btn-default">ì´ì²´</a>
							</div>
							<div class="col-md-3 button">
								ê³„ì¢Œê´€ë¦¬</a>
							</div>
							<table>
								<tr>
									<td class="moreMenu"><a href="URL"
										onclick="window.open('<%=request.getContextPath()%>/account/aliasChange?account_num=${article.account_num}', '_blank', 'top=350px,left=350px,width=460px,height=310px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">ê³„ì¢Œ
											ë³„ëª… ê´€ë¦¬</a></td>
									<td class="moreMenu"><a href="URL"
										onclick="window.open('<%=request.getContextPath()%>/account/accountCopy?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=700px,height=450px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
											ê³„ì¢Œê°œì„¤í™•ì¸ì„œ(í†µì¥ì‚¬ë³¸)</a></td>
									<td class="moreMenu"><a href="URL"
										onclick="window.open('<%=request.getContextPath()%>/account/accountPwChange?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=400px,height=250px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
											ê³„ì¢Œë¹„ë°€ë²ˆí˜¸ë³€ê²½</a></td>
									<td class="moreMenu"><a href="URL"
										onclick="window.open('<%=request.getContextPath()%>/account/accountDelete?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=400px,height=250px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
											ê³„ì¢Œí•´ì§€</a></td>
								</tr>
							</table>
						</c:forEach>
					</c:if>
				</div>
			</div>

			<div class="bs-calltoaction bs-calltoaction-info">
				<div class="row">
					<c:if test="${count2 == 0 }">
						<div class="cta-desc" align="center">
							<h3>ì¡°íšŒ ë‚´ì—­ì´ ì—†ìŠµë‹ˆë‹¤.</h3>
							</br>
							<h4>ì¬í…Œí¬ ê³ ìˆ˜ëŠ” ë†“ì¹˜ì§€ ì•ŠëŠ” ì˜ˆê¸ˆì´ì, ë‹¨ í•œë‹¬ì´ë¼ë„ ì—¬ìœ ìê¸ˆì„ ì˜ˆê¸ˆì— ë§¡ê²¨ë‘ì„¸ìš”.</h4>
						</div>
						<div class="col-md-3 cta-button">
							<a
								href="<%=request.getContextPath()%>/finance/financeMain?dbno=2"
								class="btn btn-lg btn-block btn-default">ê°€ì…í•˜ê¸°</a>
						</div>
					</c:if>
					<c:if test="${count2 != 0 }">
						<c:forEach var="article" items="${bbList}">
							<div class="col-md-9 cta-contents">
								<h1 class="cta-title">ì˜ˆê¸ˆ (${count2 })ê³„ì¢Œ</h1>
								<div class="cta-desc">
									<p>${article.account_num }</p>
									<p>${article.account_name}</p>
									<p>${article.account_alias}</p>
								</div>
							</div>
							<div class="col-md-9 cta-contents">
								<h3>ì”ì•¡ ${article.balance }ì›</h3>
							</div>
							<div class="col-md-3 cta-button">
								<a
									href="<%=request.getContextPath() %>/account/accountShow?account_num=${article.account_num}"
									class="btn btn-lg btn-block btn-default">ì¡°íšŒ</a>
							</div>
							<div class="">
								<a href="<%=request.getContextPath()%>/transfer/TransferSelect"
									class="btn btn-lg btn-block btn-default">ì´ì²´</a>
							</div>
							<div class="col-md-3 button">
								ê³„ì¢Œê´€ë¦¬</a>
							</div>
							<table>
								<tr>
									<td class="moreMenu"><a href="URL"
										onclick="window.open('<%=request.getContextPath()%>/account/aliasChange?account_num=${article.account_num}', '_blank', 'top=350px,left=350px,width=460px,height=310px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">ê³„ì¢Œ
											ë³„ëª… ê´€ë¦¬</a></td>
									<td class="moreMenu"><a href="URL"
										onclick="window.open('<%=request.getContextPath()%>/account/accountCopy?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=700px,height=450px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
											ê³„ì¢Œê°œì„¤í™•ì¸ì„œ(í†µì¥ì‚¬ë³¸)</a></td>
									<td class="moreMenu"><a href="URL"
										onclick="window.open('<%=request.getContextPath()%>/account/accountPwChange?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=400px,height=250px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
											ê³„ì¢Œë¹„ë°€ë²ˆí˜¸ë³€ê²½</a></td>
									<td class="moreMenu"><a href="URL"
										onclick="window.open('<%=request.getContextPath()%>/account/accountDelete?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=400px,height=250px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
											ê³„ì¢Œí•´ì§€</a></td>
								</tr>
							</table>
						</c:forEach>
					</c:if>
				</div>
			</div>

			<div class="bs-calltoaction bs-calltoaction-success">
				<div class="row">
					<c:if test="${count3 == 0 }">
						<div class="cta-desc" align="center">
							<h3>ì¡°íšŒ ë‚´ì—­ì´ ì—†ìŠµë‹ˆë‹¤.</h3>
							</br>
							<h4>ëª¨ì„ìˆ˜ë¡ ìŒ“ì´ëŠ” ì´ì! ë‚˜ë£¨ë±…í¬ì—ì„œ ì €ì¶•í•˜ì„¸ìš”.</h4>
						</div>
						<div class="col-md-3 cta-button">
							<a href="<%=request.getContextPath()%>/finance/financeMain?dbno=3"
								class="btn btn-lg btn-block btn-default">ê°€ì…í•˜ê¸°</a>
						</div>
					</c:if>
					<c:if test="${count3 != 0 }">
						<c:forEach var="article" items="${ccList}">
							<div class="col-md-9 cta-contents">
								<h1 class="cta-title">ì ê¸ˆ (${count3 })ê³„ì¢Œ</h1>
								<div class="cta-desc">
									<p>${article.account_num }</p>
									<p>${article.account_name}</p>
									<p>${article.account_alias}</p>
								</div>
							</div>
							<div class="col-md-9 cta-contents">
								<h3>ì”ì•¡ ${article.balance }ì›</h3>
							</div>
							<div class="col-md-3 cta-button">
								<a href="<%=request.getContextPath() %>/account/accountShow?account_num=${article.account_num}"
									class="btn btn-lg btn-block btn-default">ì¡°íšŒ</a>
							</div>
							<div class="col-md-3 button">
								ê³„ì¢Œê´€ë¦¬</a>
							</div>
							<table>
								<tr>
									<td class="moreMenu"><a href="URL"
										onclick="window.open('<%=request.getContextPath()%>/account/aliasChange?account_num=${article.account_num}', '_blank', 'top=350px,left=350px,width=460px,height=310px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">ê³„ì¢Œ
											ë³„ëª… ê´€ë¦¬</a></td>
									<td class="moreMenu"><a href="URL"
										onclick="window.open('<%=request.getContextPath()%>/account/accountCopy?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=700px,height=450px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
											ê³„ì¢Œê°œì„¤í™•ì¸ì„œ(í†µì¥ì‚¬ë³¸)</a></td>
									<td class="moreMenu"><a href="URL"
										onclick="window.open('<%=request.getContextPath()%>/account/accountPwChange?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=400px,height=250px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
											ê³„ì¢Œë¹„ë°€ë²ˆí˜¸ë³€ê²½</a></td>
									<td class="moreMenu"><a href="URL"
										onclick="window.open('<%=request.getContextPath()%>/account/accountDelete?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=400px,height=250px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
											ê³„ì¢Œí•´ì§€</a></td>
								</tr>
							</table>
						</c:forEach>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
=======
<h4>Àû±İ</h4>
<div
   style="border: 3px solid black; margin: 0px 10px 100px; width: 800;">
   <c:if test="${count3 == 0 }">
      <table class="w3-table-all" align="center">
         <tr class="w3-grey">
            <td align="center" width="1000">Á¶È¸ ³»¿ªÀÌ ¾ø½À´Ï´Ù. </br> ÀçÅ×Å© °í¼ö´Â ³õÄ¡Áö ¾Ê´Â
               ¿¹±İÀÌÀÚ, ´Ü ÇÑ´ŞÀÌ¶óµµ ¿©À¯ÀÚ±İÀ» ¿¹±İ¿¡ ¸Ã°ÜµÎ¼¼¿ä.
            </td>
            <td width="100"><a
               href="<%=request.getContextPath()%>/account/Àû±İ°¡ÀÔÇÏ±â"> °¡ÀÔÇÏ±â</a></td>
         </tr>
      </table>
   </c:if>
   <table class="w3-table-all" align="center">
      <tr class="w3-grey">
         <td align="center">Àû±İ (${count3 })°èÁÂ</td>
      </tr>
   </table>
   <c:if test="${count3 != 0 }">
      <table class="w3-table-all" align="center">
         <c:forEach var="article" items="${ccList}">
            <tr height="30">
               <td align="center" width="200">${article.account_name}</td>
               <td align="center" width="200">${article.account_num }</td>
               <td align="center" width="150">${article.account_alias }</td>
               <td align="center" width="150">ÀÜ¾× ${article.balance }¿ø</td>
              <td width="100"><a
                  href="<%=request.getContextPath() %>/account/accountShow?account_num=${article.account_num}">
                     Á¶È¸</a></td></tr>
               <td class="button" width="100">°èÁÂ°ü¸®</td>
               <tr height="30">
               <td class="moreMenu"><a href="URL"
                  onclick="window.open('<%=request.getContextPath()%>/account/aliasChange?account_num=${article.account_num}', '_blank', 'top=350px,left=350px,width=550px,height=390px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">°èÁÂ
                     º°¸í °ü¸®</a></td>
               <td class="moreMenu"><a href="URL"
                  onclick="window.open('<%=request.getContextPath()%>/account/accountCopy?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=700px,height=450px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
                     °èÁÂ°³¼³È®ÀÎ¼­(ÅëÀå»çº»)</a></td>
               <td class="moreMenu"><a href="URL"
                  onclick="window.open('<%=request.getContextPath()%>/account/accountPwChange?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=400px,height=250px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
                  °èÁÂºñ¹Ğ¹øÈ£º¯°æ</a></td>
               <td class="moreMenu"><a href="URL"
                  onclick="window.open('<%=request.getContextPath()%>/account/accountDelete?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=400px,height=250px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
                  °èÁÂÇØÁö</a></td>
            </tr>
         </c:forEach>
      </table>
   </c:if>
</div>
>>>>>>> branch 'master' of https://github.com/YangHyeonmo/FinalProject.git
