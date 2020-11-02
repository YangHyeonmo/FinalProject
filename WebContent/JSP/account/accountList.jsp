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

<h3 style="font-size: 20px; display: inline-block;">나루뱅크 계좌조회</h3>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<h3 style="font-size: 10px; display: inline-block;">
   <a href="<%=request.getContextPath()%>/openbanking/SelectOpenBanking"> 다른은행 계좌조회</a>
</h3>
<h5>
   조회기준일시:
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
					<h1 class="cta-title">${member.member_name }고객님</h1>
						<div class="cta-desc">
							<p>Describe the action here.</p>
							<p>Describe the action here.</p>
							<p>Describe the action here.</p>
						</div>
					</div>
					<div class="col-md-3 cta-button">
						<p>총 잔액</p>
						<h2>~~원</h2>
					</div>
<h4>입출금</h4>
<div
   style="border: 3px solid black; margin: 0px 10px 100px; width: 800;">
   <table class="w3-table-all" align="center">
      <tr class="w3-grey">
         <td align="center">입출금 (${count1 })계좌</td>
      </tr>
   </table>
   <c:if test="${count1 == 0 }">
      <table class="w3-table-all" align="center">
         <tr class="w3-grey">
            <td align="center" width="1000"><strong>입출금통장</strong> 만들 때 <br />은행
               방문 NO, 이젠 모바일로 손안에서 OK</br></td>
            <td width="100"><a
               href="<%=request.getContextPath()%>/finance/financeMain"> 개설하기</a></td>
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
               <td align="center" width="150">잔액 ${article.balance }원</td>
               <td width="100"><a
                  href="<%=request.getContextPath() %>/account/accountShow?account_num=${article.account_num}">
                     조회</a></td></tr>
               <td width="100"><a
                  href="<%=request.getContextPath()%>/transfer/TransferSelect"> 이체</a></td>
               <td class="button" width="100">계좌관리</td>
               <tr height="30">
               <td class="moreMenu"><a href="URL"
                  onclick="window.open('<%=request.getContextPath()%>/account/aliasChange?account_num=${article.account_num}', '_blank', 'top=350px,left=350px,width=550px,height=390px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">계좌
                     별명 관리</a></td>
               <td class="moreMenu"><a href="URL"
                  onclick="window.open('<%=request.getContextPath()%>/account/accountCopy?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=700px,height=450px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
                     계좌개설확인서(통장사본)</a></td>
               <td class="moreMenu"><a href="URL"
                  onclick="window.open('<%=request.getContextPath()%>/account/accountPwChange?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=400px,height=250px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
                  계좌비밀번호변경</a></td>
               <td class="moreMenu"><a href="URL"
                  onclick="window.open('<%=request.getContextPath()%>/account/accountDelete?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=400px,height=250px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
                  계좌해지</a></td>
            </tr>
         </c:forEach>
      </table>
   </c:if>
</div>

<h4>예금</h4>
<div
   style="border: 3px solid black; margin: 0px 10px 100px; width: 800;">
   <c:if test="${count2 == 0 }">
      <table class="w3-table-all" align="center">
         <tr class="w3-grey">
            <td align="center" width="1000">조회 내역이 없습니다. </br> 재테크 고수는 놓치지 않는
               예금이자, 단 한달이라도 여유자금을 예금에 맡겨두세요.
            </td>
            <td width="100"><a
               href="<%=request.getContextPath()%>/finance/financeMain"> 가입하기</a></td>
         </tr>
      </table>
   </c:if>
   <c:if test="${count2 != 0 }">
      <table class="w3-table-all" align="center">
         <tr class="w3-grey">
            <td align="center">예금 (${count2 })계좌</td>
         </tr>
      </table>
      <table class="w3-table-all" align="center">
         <c:forEach var="article" items="${bbList}">
            <tr height="30">
               <td align="center" width="200">${article.account_name}</td>
               <td align="center" width="200">${article.account_num }</td>
               <td align="center" width="150">${article.account_alias }</td>
               <td align="center" width="150">잔액 ${article.balance }원</td>
              <td width="100"><a
                  href="<%=request.getContextPath() %>/account/accountShow?account_num=${article.account_num}">
                     조회</a></td></tr>
               <td width="100"><a
                  href="<%=request.getContextPath()%>/transfer/TransferSelect"> 이체</a></td>
               <td class="button" width="100">계좌관리</td>
               <tr height="30">
               <td class="moreMenu"><a href="URL"
                  onclick="window.open('<%=request.getContextPath()%>/account/aliasChange?account_num=${article.account_num}', '_blank', 'top=350px,left=350px,width=550px,height=390px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">계좌
                     별명 관리</a></td>
               <td class="moreMenu"><a href="URL"
                  onclick="window.open('<%=request.getContextPath()%>/account/accountCopy?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=700px,height=450px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
                     계좌개설확인서(통장사본)</a></td>
               <td class="moreMenu"><a href="URL"
                  onclick="window.open('<%=request.getContextPath()%>/account/accountPwChange?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=400px,height=250px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
                  계좌비밀번호변경</a></td>
               <td class="moreMenu"><a href="URL"
                  onclick="window.open('<%=request.getContextPath()%>/account/accountDelete?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=400px,height=250px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
                  계좌해지</a></td>
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
								<td align="center" width="1000"><strong>�엯異쒓툑�넻�옣</strong> 留뚮뱾 �븣
									<br />����뻾 諛⑸Ц NO, �씠�젨 紐⑤컮�씪濡� �넀�븞�뿉�꽌 OK</br></td>
								<td width="100"><a
									href="<%=request.getContextPath()%>/finance/financeMain?dbno=1">
										媛쒖꽕�븯湲�</a></td>
							</tr>
						</table>
					</c:if>
					<c:if test="${count1 != 0 }">
						<c:forEach var="article" items="${aaList}">
							<div class="col-md-9 cta-contents">
								<h1 class="cta-title">�엯異쒓툑</h1>
								<p>(${count1 })怨꾩쥖</p>
								<div class="cta-desc">
									<p>${article.account_num }</p>
									<p>${article.account_name}</p>
									<p>${article.account_alias}</p>
								</div>
							</div>
							<div class="col-md-9 cta-contents">
								<h3>�옍�븸 ${article.balance }�썝</h3>
							</div>
							<div class="col-md-3 cta-button">
								<a
									href="<%=request.getContextPath() %>/account/accountShow?account_num=${article.account_num}"
									class="btn btn-lg btn-block btn-default">議고쉶</a>
							</div>
							<div class="">
								<a href="<%=request.getContextPath()%>/transfer/TransferSelect"
									class="btn btn-lg btn-block btn-default">�씠泥�</a>
							</div>
							<div class="col-md-3 button">
								怨꾩쥖愿�由�</a>
							</div>
							<table>
								<tr>
									<td class="moreMenu"><a href="URL"
										onclick="window.open('<%=request.getContextPath()%>/account/aliasChange?account_num=${article.account_num}', '_blank', 'top=350px,left=350px,width=460px,height=310px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">怨꾩쥖
											蹂꾨챸 愿�由�</a></td>
									<td class="moreMenu"><a href="URL"
										onclick="window.open('<%=request.getContextPath()%>/account/accountCopy?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=700px,height=450px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
											怨꾩쥖媛쒖꽕�솗�씤�꽌(�넻�옣�궗蹂�)</a></td>
									<td class="moreMenu"><a href="URL"
										onclick="window.open('<%=request.getContextPath()%>/account/accountPwChange?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=400px,height=250px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
											怨꾩쥖鍮꾨��踰덊샇蹂�寃�</a></td>
									<td class="moreMenu"><a href="URL"
										onclick="window.open('<%=request.getContextPath()%>/account/accountDelete?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=400px,height=250px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
											怨꾩쥖�빐吏�</a></td>
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
							<h3>議고쉶 �궡�뿭�씠 �뾾�뒿�땲�떎.</h3>
							</br>
							<h4>�옱�뀒�겕 怨좎닔�뒗 �넃移섏�� �븡�뒗 �삁湲덉씠�옄, �떒 �븳�떖�씠�씪�룄 �뿬�쑀�옄湲덉쓣 �삁湲덉뿉 留↔꺼�몢�꽭�슂.</h4>
						</div>
						<div class="col-md-3 cta-button">
							<a
								href="<%=request.getContextPath()%>/finance/financeMain?dbno=2"
								class="btn btn-lg btn-block btn-default">媛��엯�븯湲�</a>
						</div>
					</c:if>
					<c:if test="${count2 != 0 }">
						<c:forEach var="article" items="${bbList}">
							<div class="col-md-9 cta-contents">
								<h1 class="cta-title">�삁湲� (${count2 })怨꾩쥖</h1>
								<div class="cta-desc">
									<p>${article.account_num }</p>
									<p>${article.account_name}</p>
									<p>${article.account_alias}</p>
								</div>
							</div>
							<div class="col-md-9 cta-contents">
								<h3>�옍�븸 ${article.balance }�썝</h3>
							</div>
							<div class="col-md-3 cta-button">
								<a
									href="<%=request.getContextPath() %>/account/accountShow?account_num=${article.account_num}"
									class="btn btn-lg btn-block btn-default">議고쉶</a>
							</div>
							<div class="">
								<a href="<%=request.getContextPath()%>/transfer/TransferSelect"
									class="btn btn-lg btn-block btn-default">�씠泥�</a>
							</div>
							<div class="col-md-3 button">
								怨꾩쥖愿�由�</a>
							</div>
							<table>
								<tr>
									<td class="moreMenu"><a href="URL"
										onclick="window.open('<%=request.getContextPath()%>/account/aliasChange?account_num=${article.account_num}', '_blank', 'top=350px,left=350px,width=460px,height=310px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">怨꾩쥖
											蹂꾨챸 愿�由�</a></td>
									<td class="moreMenu"><a href="URL"
										onclick="window.open('<%=request.getContextPath()%>/account/accountCopy?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=700px,height=450px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
											怨꾩쥖媛쒖꽕�솗�씤�꽌(�넻�옣�궗蹂�)</a></td>
									<td class="moreMenu"><a href="URL"
										onclick="window.open('<%=request.getContextPath()%>/account/accountPwChange?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=400px,height=250px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
											怨꾩쥖鍮꾨��踰덊샇蹂�寃�</a></td>
									<td class="moreMenu"><a href="URL"
										onclick="window.open('<%=request.getContextPath()%>/account/accountDelete?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=400px,height=250px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
											怨꾩쥖�빐吏�</a></td>
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
							<h3>議고쉶 �궡�뿭�씠 �뾾�뒿�땲�떎.</h3>
							</br>
							<h4>紐⑥쓣�닔濡� �뙎�씠�뒗 �씠�옄! �굹猷⑤콉�겕�뿉�꽌 ���異뺥븯�꽭�슂.</h4>
						</div>
						<div class="col-md-3 cta-button">
							<a href="<%=request.getContextPath()%>/finance/financeMain?dbno=3"
								class="btn btn-lg btn-block btn-default">媛��엯�븯湲�</a>
						</div>
					</c:if>
					<c:if test="${count3 != 0 }">
						<c:forEach var="article" items="${ccList}">
							<div class="col-md-9 cta-contents">
								<h1 class="cta-title">�쟻湲� (${count3 })怨꾩쥖</h1>
								<div class="cta-desc">
									<p>${article.account_num }</p>
									<p>${article.account_name}</p>
									<p>${article.account_alias}</p>
								</div>
							</div>
							<div class="col-md-9 cta-contents">
								<h3>�옍�븸 ${article.balance }�썝</h3>
							</div>
							<div class="col-md-3 cta-button">
								<a href="<%=request.getContextPath() %>/account/accountShow?account_num=${article.account_num}"
									class="btn btn-lg btn-block btn-default">議고쉶</a>
							</div>
							<div class="col-md-3 button">
								怨꾩쥖愿�由�</a>
							</div>
							<table>
								<tr>
									<td class="moreMenu"><a href="URL"
										onclick="window.open('<%=request.getContextPath()%>/account/aliasChange?account_num=${article.account_num}', '_blank', 'top=350px,left=350px,width=460px,height=310px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">怨꾩쥖
											蹂꾨챸 愿�由�</a></td>
									<td class="moreMenu"><a href="URL"
										onclick="window.open('<%=request.getContextPath()%>/account/accountCopy?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=700px,height=450px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
											怨꾩쥖媛쒖꽕�솗�씤�꽌(�넻�옣�궗蹂�)</a></td>
									<td class="moreMenu"><a href="URL"
										onclick="window.open('<%=request.getContextPath()%>/account/accountPwChange?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=400px,height=250px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
											怨꾩쥖鍮꾨��踰덊샇蹂�寃�</a></td>
									<td class="moreMenu"><a href="URL"
										onclick="window.open('<%=request.getContextPath()%>/account/accountDelete?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=400px,height=250px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
											怨꾩쥖�빐吏�</a></td>
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
<h4>적금</h4>
<div
   style="border: 3px solid black; margin: 0px 10px 100px; width: 800;">
   <c:if test="${count3 == 0 }">
      <table class="w3-table-all" align="center">
         <tr class="w3-grey">
            <td align="center" width="1000">조회 내역이 없습니다. </br> 재테크 고수는 놓치지 않는
               예금이자, 단 한달이라도 여유자금을 예금에 맡겨두세요.
            </td>
            <td width="100"><a
               href="<%=request.getContextPath()%>/account/적금가입하기"> 가입하기</a></td>
         </tr>
      </table>
   </c:if>
   <table class="w3-table-all" align="center">
      <tr class="w3-grey">
         <td align="center">적금 (${count3 })계좌</td>
      </tr>
   </table>
   <c:if test="${count3 != 0 }">
      <table class="w3-table-all" align="center">
         <c:forEach var="article" items="${ccList}">
            <tr height="30">
               <td align="center" width="200">${article.account_name}</td>
               <td align="center" width="200">${article.account_num }</td>
               <td align="center" width="150">${article.account_alias }</td>
               <td align="center" width="150">잔액 ${article.balance }원</td>
              <td width="100"><a
                  href="<%=request.getContextPath() %>/account/accountShow?account_num=${article.account_num}">
                     조회</a></td></tr>
               <td class="button" width="100">계좌관리</td>
               <tr height="30">
               <td class="moreMenu"><a href="URL"
                  onclick="window.open('<%=request.getContextPath()%>/account/aliasChange?account_num=${article.account_num}', '_blank', 'top=350px,left=350px,width=550px,height=390px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">계좌
                     별명 관리</a></td>
               <td class="moreMenu"><a href="URL"
                  onclick="window.open('<%=request.getContextPath()%>/account/accountCopy?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=700px,height=450px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
                     계좌개설확인서(통장사본)</a></td>
               <td class="moreMenu"><a href="URL"
                  onclick="window.open('<%=request.getContextPath()%>/account/accountPwChange?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=400px,height=250px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
                  계좌비밀번호변경</a></td>
               <td class="moreMenu"><a href="URL"
                  onclick="window.open('<%=request.getContextPath()%>/account/accountDelete?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=400px,height=250px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
                  계좌해지</a></td>
            </tr>
         </c:forEach>
      </table>
   </c:if>
</div>
>>>>>>> branch 'master' of https://github.com/YangHyeonmo/FinalProject.git
