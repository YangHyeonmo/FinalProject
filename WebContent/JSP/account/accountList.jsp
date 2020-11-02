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

<h3 style="font-size: 20px; display: inline-block;">�����ũ ������ȸ</h3>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<h3 style="font-size: 10px; display: inline-block;">
   <a href="<%=request.getContextPath()%>/openbanking/SelectOpenBanking"> �ٸ����� ������ȸ</a>
</h3>
<h5>
   ��ȸ�����Ͻ�:
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
					<h1 class="cta-title">${member.member_name }����</h1>
						<div class="cta-desc">
							<p>Describe the action here.</p>
							<p>Describe the action here.</p>
							<p>Describe the action here.</p>
						</div>
					</div>
					<div class="col-md-3 cta-button">
						<p>�� �ܾ�</p>
						<h2>~~��</h2>
					</div>
<h4>�����</h4>
<div
   style="border: 3px solid black; margin: 0px 10px 100px; width: 800;">
   <table class="w3-table-all" align="center">
      <tr class="w3-grey">
         <td align="center">����� (${count1 })����</td>
      </tr>
   </table>
   <c:if test="${count1 == 0 }">
      <table class="w3-table-all" align="center">
         <tr class="w3-grey">
            <td align="center" width="1000"><strong>���������</strong> ���� �� <br />����
               �湮 NO, ���� ����Ϸ� �վȿ��� OK</br></td>
            <td width="100"><a
               href="<%=request.getContextPath()%>/finance/financeMain"> �����ϱ�</a></td>
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
               <td align="center" width="150">�ܾ� ${article.balance }��</td>
               <td width="100"><a
                  href="<%=request.getContextPath() %>/account/accountShow?account_num=${article.account_num}">
                     ��ȸ</a></td></tr>
               <td width="100"><a
                  href="<%=request.getContextPath()%>/transfer/TransferSelect"> ��ü</a></td>
               <td class="button" width="100">���°���</td>
               <tr height="30">
               <td class="moreMenu"><a href="URL"
                  onclick="window.open('<%=request.getContextPath()%>/account/aliasChange?account_num=${article.account_num}', '_blank', 'top=350px,left=350px,width=550px,height=390px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">����
                     ���� ����</a></td>
               <td class="moreMenu"><a href="URL"
                  onclick="window.open('<%=request.getContextPath()%>/account/accountCopy?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=700px,height=450px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
                     ���°���Ȯ�μ�(����纻)</a></td>
               <td class="moreMenu"><a href="URL"
                  onclick="window.open('<%=request.getContextPath()%>/account/accountPwChange?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=400px,height=250px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
                  ���º�й�ȣ����</a></td>
               <td class="moreMenu"><a href="URL"
                  onclick="window.open('<%=request.getContextPath()%>/account/accountDelete?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=400px,height=250px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
                  ��������</a></td>
            </tr>
         </c:forEach>
      </table>
   </c:if>
</div>

<h4>����</h4>
<div
   style="border: 3px solid black; margin: 0px 10px 100px; width: 800;">
   <c:if test="${count2 == 0 }">
      <table class="w3-table-all" align="center">
         <tr class="w3-grey">
            <td align="center" width="1000">��ȸ ������ �����ϴ�. </br> ����ũ ����� ��ġ�� �ʴ�
               ��������, �� �Ѵ��̶� �����ڱ��� ���ݿ� �ðܵμ���.
            </td>
            <td width="100"><a
               href="<%=request.getContextPath()%>/finance/financeMain"> �����ϱ�</a></td>
         </tr>
      </table>
   </c:if>
   <c:if test="${count2 != 0 }">
      <table class="w3-table-all" align="center">
         <tr class="w3-grey">
            <td align="center">���� (${count2 })����</td>
         </tr>
      </table>
      <table class="w3-table-all" align="center">
         <c:forEach var="article" items="${bbList}">
            <tr height="30">
               <td align="center" width="200">${article.account_name}</td>
               <td align="center" width="200">${article.account_num }</td>
               <td align="center" width="150">${article.account_alias }</td>
               <td align="center" width="150">�ܾ� ${article.balance }��</td>
              <td width="100"><a
                  href="<%=request.getContextPath() %>/account/accountShow?account_num=${article.account_num}">
                     ��ȸ</a></td></tr>
               <td width="100"><a
                  href="<%=request.getContextPath()%>/transfer/TransferSelect"> ��ü</a></td>
               <td class="button" width="100">���°���</td>
               <tr height="30">
               <td class="moreMenu"><a href="URL"
                  onclick="window.open('<%=request.getContextPath()%>/account/aliasChange?account_num=${article.account_num}', '_blank', 'top=350px,left=350px,width=550px,height=390px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">����
                     ���� ����</a></td>
               <td class="moreMenu"><a href="URL"
                  onclick="window.open('<%=request.getContextPath()%>/account/accountCopy?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=700px,height=450px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
                     ���°���Ȯ�μ�(����纻)</a></td>
               <td class="moreMenu"><a href="URL"
                  onclick="window.open('<%=request.getContextPath()%>/account/accountPwChange?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=400px,height=250px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
                  ���º�й�ȣ����</a></td>
               <td class="moreMenu"><a href="URL"
                  onclick="window.open('<%=request.getContextPath()%>/account/accountDelete?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=400px,height=250px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
                  ��������</a></td>
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
								<td align="center" width="1000"><strong>입출금통장</strong> 만들 때
									<br />은행 방문 NO, 이젠 모바일로 손안에서 OK</br></td>
								<td width="100"><a
									href="<%=request.getContextPath()%>/finance/financeMain?dbno=1">
										개설하기</a></td>
							</tr>
						</table>
					</c:if>
					<c:if test="${count1 != 0 }">
						<c:forEach var="article" items="${aaList}">
							<div class="col-md-9 cta-contents">
								<h1 class="cta-title">입출금</h1>
								<p>(${count1 })계좌</p>
								<div class="cta-desc">
									<p>${article.account_num }</p>
									<p>${article.account_name}</p>
									<p>${article.account_alias}</p>
								</div>
							</div>
							<div class="col-md-9 cta-contents">
								<h3>잔액 ${article.balance }원</h3>
							</div>
							<div class="col-md-3 cta-button">
								<a
									href="<%=request.getContextPath() %>/account/accountShow?account_num=${article.account_num}"
									class="btn btn-lg btn-block btn-default">조회</a>
							</div>
							<div class="">
								<a href="<%=request.getContextPath()%>/transfer/TransferSelect"
									class="btn btn-lg btn-block btn-default">이체</a>
							</div>
							<div class="col-md-3 button">
								계좌관리</a>
							</div>
							<table>
								<tr>
									<td class="moreMenu"><a href="URL"
										onclick="window.open('<%=request.getContextPath()%>/account/aliasChange?account_num=${article.account_num}', '_blank', 'top=350px,left=350px,width=460px,height=310px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">계좌
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
							</table>
						</c:forEach>
					</c:if>
				</div>
			</div>

			<div class="bs-calltoaction bs-calltoaction-info">
				<div class="row">
					<c:if test="${count2 == 0 }">
						<div class="cta-desc" align="center">
							<h3>조회 내역이 없습니다.</h3>
							</br>
							<h4>재테크 고수는 놓치지 않는 예금이자, 단 한달이라도 여유자금을 예금에 맡겨두세요.</h4>
						</div>
						<div class="col-md-3 cta-button">
							<a
								href="<%=request.getContextPath()%>/finance/financeMain?dbno=2"
								class="btn btn-lg btn-block btn-default">가입하기</a>
						</div>
					</c:if>
					<c:if test="${count2 != 0 }">
						<c:forEach var="article" items="${bbList}">
							<div class="col-md-9 cta-contents">
								<h1 class="cta-title">예금 (${count2 })계좌</h1>
								<div class="cta-desc">
									<p>${article.account_num }</p>
									<p>${article.account_name}</p>
									<p>${article.account_alias}</p>
								</div>
							</div>
							<div class="col-md-9 cta-contents">
								<h3>잔액 ${article.balance }원</h3>
							</div>
							<div class="col-md-3 cta-button">
								<a
									href="<%=request.getContextPath() %>/account/accountShow?account_num=${article.account_num}"
									class="btn btn-lg btn-block btn-default">조회</a>
							</div>
							<div class="">
								<a href="<%=request.getContextPath()%>/transfer/TransferSelect"
									class="btn btn-lg btn-block btn-default">이체</a>
							</div>
							<div class="col-md-3 button">
								계좌관리</a>
							</div>
							<table>
								<tr>
									<td class="moreMenu"><a href="URL"
										onclick="window.open('<%=request.getContextPath()%>/account/aliasChange?account_num=${article.account_num}', '_blank', 'top=350px,left=350px,width=460px,height=310px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">계좌
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
							</table>
						</c:forEach>
					</c:if>
				</div>
			</div>

			<div class="bs-calltoaction bs-calltoaction-success">
				<div class="row">
					<c:if test="${count3 == 0 }">
						<div class="cta-desc" align="center">
							<h3>조회 내역이 없습니다.</h3>
							</br>
							<h4>모을수록 쌓이는 이자! 나루뱅크에서 저축하세요.</h4>
						</div>
						<div class="col-md-3 cta-button">
							<a href="<%=request.getContextPath()%>/finance/financeMain?dbno=3"
								class="btn btn-lg btn-block btn-default">가입하기</a>
						</div>
					</c:if>
					<c:if test="${count3 != 0 }">
						<c:forEach var="article" items="${ccList}">
							<div class="col-md-9 cta-contents">
								<h1 class="cta-title">적금 (${count3 })계좌</h1>
								<div class="cta-desc">
									<p>${article.account_num }</p>
									<p>${article.account_name}</p>
									<p>${article.account_alias}</p>
								</div>
							</div>
							<div class="col-md-9 cta-contents">
								<h3>잔액 ${article.balance }원</h3>
							</div>
							<div class="col-md-3 cta-button">
								<a href="<%=request.getContextPath() %>/account/accountShow?account_num=${article.account_num}"
									class="btn btn-lg btn-block btn-default">조회</a>
							</div>
							<div class="col-md-3 button">
								계좌관리</a>
							</div>
							<table>
								<tr>
									<td class="moreMenu"><a href="URL"
										onclick="window.open('<%=request.getContextPath()%>/account/aliasChange?account_num=${article.account_num}', '_blank', 'top=350px,left=350px,width=460px,height=310px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">계좌
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
<h4>����</h4>
<div
   style="border: 3px solid black; margin: 0px 10px 100px; width: 800;">
   <c:if test="${count3 == 0 }">
      <table class="w3-table-all" align="center">
         <tr class="w3-grey">
            <td align="center" width="1000">��ȸ ������ �����ϴ�. </br> ����ũ ����� ��ġ�� �ʴ�
               ��������, �� �Ѵ��̶� �����ڱ��� ���ݿ� �ðܵμ���.
            </td>
            <td width="100"><a
               href="<%=request.getContextPath()%>/account/���ݰ����ϱ�"> �����ϱ�</a></td>
         </tr>
      </table>
   </c:if>
   <table class="w3-table-all" align="center">
      <tr class="w3-grey">
         <td align="center">���� (${count3 })����</td>
      </tr>
   </table>
   <c:if test="${count3 != 0 }">
      <table class="w3-table-all" align="center">
         <c:forEach var="article" items="${ccList}">
            <tr height="30">
               <td align="center" width="200">${article.account_name}</td>
               <td align="center" width="200">${article.account_num }</td>
               <td align="center" width="150">${article.account_alias }</td>
               <td align="center" width="150">�ܾ� ${article.balance }��</td>
              <td width="100"><a
                  href="<%=request.getContextPath() %>/account/accountShow?account_num=${article.account_num}">
                     ��ȸ</a></td></tr>
               <td class="button" width="100">���°���</td>
               <tr height="30">
               <td class="moreMenu"><a href="URL"
                  onclick="window.open('<%=request.getContextPath()%>/account/aliasChange?account_num=${article.account_num}', '_blank', 'top=350px,left=350px,width=550px,height=390px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">����
                     ���� ����</a></td>
               <td class="moreMenu"><a href="URL"
                  onclick="window.open('<%=request.getContextPath()%>/account/accountCopy?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=700px,height=450px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
                     ���°���Ȯ�μ�(����纻)</a></td>
               <td class="moreMenu"><a href="URL"
                  onclick="window.open('<%=request.getContextPath()%>/account/accountPwChange?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=400px,height=250px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
                  ���º�й�ȣ����</a></td>
               <td class="moreMenu"><a href="URL"
                  onclick="window.open('<%=request.getContextPath()%>/account/accountDelete?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=400px,height=250px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
                  ��������</a></td>
            </tr>
         </c:forEach>
      </table>
   </c:if>
</div>
>>>>>>> branch 'master' of https://github.com/YangHyeonmo/FinalProject.git
