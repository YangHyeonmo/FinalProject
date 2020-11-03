<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
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

<h3 style="font-size: 20px; display: inline-block;">��猷⑤��� 怨�醫�議고��</h3>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<h3 style="font-size: 10px; display: inline-block;">
   <a href="<%=request.getContextPath()%>/openbanking/SelectOpenBanking"> �ㅻⅨ���� 怨�醫�議고��</a>
</h3>
<h5>
   議고��湲곗��쇱��:
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
					<h1 class="cta-title">${member.member_name }怨�媛���</h1>
						<div class="cta-desc">
							<p>Describe the action here.</p>
							<p>Describe the action here.</p>
							<p>Describe the action here.</p>
						</div>
					</div>
					<div class="col-md-3 cta-button">
						<p>珥� ����</p>
						<h2>~~��</h2>
					</div>
<h4>��異�湲�</h4>
<div
   style="border: 3px solid black; margin: 0px 10px 100px; width: 800;">
   <table class="w3-table-all" align="center">
      <tr class="w3-grey">
         <td align="center">��異�湲� (${count1 })怨�醫�</td>
      </tr>
   </table>
   <c:if test="${count1 == 0 }">
      <table class="w3-table-all" align="center">
         <tr class="w3-grey">
            <td align="center" width="1000"><strong>��異�湲��듭��</strong> 留��� �� <br />����
               諛⑸Ц NO, �댁�� 紐⑤��쇰� �������� OK</br></td>
            <td width="100"><a
               href="<%=request.getContextPath()%>/finance/financeMain?dbno=1"> 媛��ㅽ��湲�</a></td>
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
               <td align="center" width="150">���� ${article.balance }��</td>
               <td width="100"><a
                  href="<%=request.getContextPath() %>/account/accountShow?account_num=${article.account_num}">
                     議고��</a></td></tr>
               <td width="100"><a
                  href="<%=request.getContextPath()%>/transfer/TransferWrite"> �댁껜</a></td>
               <td class="button" width="100">怨�醫�愿�由�</td>
               <tr height="30">
               <td class="moreMenu"><a href="URL"
                  onclick="window.open('<%=request.getContextPath()%>/account/aliasChange?account_num=${article.account_num}', '_blank', 'top=350px,left=350px,width=550px,height=390px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">怨�醫�
                     蹂�紐� 愿�由�</a></td>
               <td class="moreMenu"><a href="URL"
                  onclick="window.open('<%=request.getContextPath()%>/account/accountCopy?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=700px,height=450px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
                     怨�醫�媛��ㅽ���몄��(�듭�μ�щ낯)</a></td>
               <td class="moreMenu"><a href="URL"
                  onclick="window.open('<%=request.getContextPath()%>/account/accountPwChange?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=400px,height=250px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
                  怨�醫�鍮�諛�踰��몃�寃�</a></td>
               <td class="moreMenu"><a href="URL"
                  onclick="window.open('<%=request.getContextPath()%>/account/accountDelete?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=400px,height=250px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
                  怨�醫��댁�</a></td>
            </tr>
         </c:forEach>
      </table>
   </c:if>
</div>

<h4>��湲�</h4>
<div
   style="border: 3px solid black; margin: 0px 10px 100px; width: 800;">
   <c:if test="${count2 == 0 }">
      <table class="w3-table-all" align="center">
         <tr class="w3-grey">
            <td align="center" width="1000">議고�� �댁���� ���듬����. </br> �ы���� 怨����� ��移�吏� ����
               ��湲��댁��, �� ���ъ�대�쇰�� �ъ����湲��� ��湲��� 留↔꺼���몄��.
            </td>
            <td width="100"><a
               href="<%=request.getContextPath()%>/finance/financeMain?dbno=2"> 媛�����湲�</a></td>
         </tr>
      </table>
   </c:if>
   <c:if test="${count2 != 0 }">
      <table class="w3-table-all" align="center">
         <tr class="w3-grey">
            <td align="center">��湲� (${count2 })怨�醫�</td>
         </tr>
      </table>
      <table class="w3-table-all" align="center">
         <c:forEach var="article" items="${bbList}">
            <tr height="30">
               <td align="center" width="200">${article.account_name}</td>
               <td align="center" width="200">${article.account_num }</td>
               <td align="center" width="150">${article.account_alias }</td>
               <td align="center" width="150">���� ${article.balance }��</td>
              <td width="100"><a
                  href="<%=request.getContextPath() %>/account/accountShow?account_num=${article.account_num}">
                     議고��</a></td></tr>
               <td width="100"><a
                  href="<%=request.getContextPath()%>/transfer/TransferWrite"> �댁껜</a></td>
               <td class="button" width="100">怨�醫�愿�由�</td>
               <tr height="30">
               <td class="moreMenu"><a href="URL"
                  onclick="window.open('<%=request.getContextPath()%>/account/aliasChange?account_num=${article.account_num}', '_blank', 'top=350px,left=350px,width=550px,height=390px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">怨�醫�
                     蹂�紐� 愿�由�</a></td>
               <td class="moreMenu"><a href="URL"
                  onclick="window.open('<%=request.getContextPath()%>/account/accountCopy?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=700px,height=450px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
                     怨�醫�媛��ㅽ���몄��(�듭�μ�щ낯)</a></td>
               <td class="moreMenu"><a href="URL"
                  onclick="window.open('<%=request.getContextPath()%>/account/accountPwChange?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=400px,height=250px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
                  怨�醫�鍮�諛�踰��몃�寃�</a></td>
               <td class="moreMenu"><a href="URL"
                  onclick="window.open('<%=request.getContextPath()%>/account/accountDelete?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=400px,height=250px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
                  怨�醫��댁�</a></td>
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
								<td align="center" width="1000"><strong>占쏙옙�곤옙疫뀐옙占쎈��占쏙옙</strong> 筌�占쏙옙占� 占쏙옙
									<br />占쏙옙占쏙옙 獄��먁� NO, 占쎈��占쏙옙 筌��ㅿ옙占쎌�곤옙 占쏙옙占쏙옙占쏙옙占쏙옙 OK</br></td>
								<td width="100"><a
									href="<%=request.getContextPath()%>/finance/financeMain?dbno=1">
										揶�占쏙옙�쏙옙占썸묾占�</a></td>
							</tr>
						</table>
					</c:if>
					<c:if test="${count1 != 0 }">
						<c:forEach var="article" items="${aaList}">
							<div class="col-md-9 cta-contents">
								<h1 class="cta-title">占쏙옙�곤옙疫뀐옙</h1>
								<p>(${count1 })�⑨옙�ワ옙</p>
								<div class="cta-desc">
									<p>${article.account_num }</p>
									<p>${article.account_name}</p>
									<p>${article.account_alias}</p>
								</div>
							</div>
							<div class="col-md-9 cta-contents">
								<h3>占쏙옙占쏙옙 ${article.balance }占쏙옙</h3>
							</div>
							<div class="col-md-3 cta-button">
								<a
									href="<%=request.getContextPath() %>/account/accountShow?account_num=${article.account_num}"
									class="btn btn-lg btn-block btn-default">鈺곌�占쏙옙</a>
							</div>
							<div class="">
								<a href="<%=request.getContextPath()%>/transfer/TransferSelect"
									class="btn btn-lg btn-block btn-default">占쎈��猿�</a>
							</div>
							<div class="col-md-3 button">
								�⑨옙�ワ옙�울옙�깍옙</a>
							</div>
							<table>
								<tr>
									<td class="moreMenu"><a href="URL"
										onclick="window.open('<%=request.getContextPath()%>/account/aliasChange?account_num=${article.account_num}', '_blank', 'top=350px,left=350px,width=460px,height=310px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">�⑨옙�ワ옙
											癰�占쏙�占� �울옙�깍옙</a></td>
									<td class="moreMenu"><a href="URL"
										onclick="window.open('<%=request.getContextPath()%>/account/accountCopy?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=700px,height=450px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
											�⑨옙�ワ옙揶�占쏙옙�쏙옙占쏙옙紐�占쏙옙(占쎈��占싸쇽옙���)</a></td>
									<td class="moreMenu"><a href="URL"
										onclick="window.open('<%=request.getContextPath()%>/account/accountPwChange?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=400px,height=250px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
											�⑨옙�ワ옙��占썼�占썼린占쏙옙紐�占썲��占�</a></td>
									<td class="moreMenu"><a href="URL"
										onclick="window.open('<%=request.getContextPath()%>/account/accountDelete?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=400px,height=250px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
											�⑨옙�ワ옙占쎈��占�</a></td>
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
							<h3>鈺곌�占쏙옙 占쎈��占쏙옙占쏙옙 占쏙옙占쎈�э옙占쏙옙占�.</h3>
							</br>
							<h4>占싼�占쏙옙占쏙옙 �⑨옙占쏙옙占쏙옙 占쏙옙燁삼옙筌�占� 占쏙옙占쏙옙 占쏙옙疫뀐옙占쎈��占쏙옙, 占쏙옙 占쏙옙占싼�占쎈��占쎌�곤옙占� 占싼�占쏙옙占쏙옙疫뀐옙占쏙옙 占쏙옙疫뀐옙占쏙옙 筌���爰쇽옙占쏙옙紐�占쏙옙.</h4>
						</div>
						<div class="col-md-3 cta-button">
							<a
								href="<%=request.getContextPath()%>/finance/financeMain?dbno=2"
								class="btn btn-lg btn-block btn-default">揶�占쏙옙占쏙옙占썸묾占�</a>
						</div>
					</c:if>
					<c:if test="${count2 != 0 }">
						<c:forEach var="article" items="${bbList}">
							<div class="col-md-9 cta-contents">
								<h1 class="cta-title">占쏙옙疫뀐옙 (${count2 })�⑨옙�ワ옙</h1>
								<div class="cta-desc">
									<p>${article.account_num }</p>
									<p>${article.account_name}</p>
									<p>${article.account_alias}</p>
								</div>
							</div>
							<div class="col-md-9 cta-contents">
								<h3>占쏙옙占쏙옙 ${article.balance }占쏙옙</h3>
							</div>
							<div class="col-md-3 cta-button">
								<a
									href="<%=request.getContextPath() %>/account/accountShow?account_num=${article.account_num}"
									class="btn btn-lg btn-block btn-default">鈺곌�占쏙옙</a>
							</div>
							<div class="">
								<a href="<%=request.getContextPath()%>/transfer/TransferSelect"
									class="btn btn-lg btn-block btn-default">占쎈��猿�</a>
							</div>
							<div class="col-md-3 button">
								�⑨옙�ワ옙�울옙�깍옙</a>
							</div>
							<table>
								<tr>
									<td class="moreMenu"><a href="URL"
										onclick="window.open('<%=request.getContextPath()%>/account/aliasChange?account_num=${article.account_num}', '_blank', 'top=350px,left=350px,width=460px,height=310px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">�⑨옙�ワ옙
											癰�占쏙�占� �울옙�깍옙</a></td>
									<td class="moreMenu"><a href="URL"
										onclick="window.open('<%=request.getContextPath()%>/account/accountCopy?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=700px,height=450px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
											�⑨옙�ワ옙揶�占쏙옙�쏙옙占쏙옙紐�占쏙옙(占쎈��占싸쇽옙���)</a></td>
									<td class="moreMenu"><a href="URL"
										onclick="window.open('<%=request.getContextPath()%>/account/accountPwChange?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=400px,height=250px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
											�⑨옙�ワ옙��占썼�占썼린占쏙옙紐�占썲��占�</a></td>
									<td class="moreMenu"><a href="URL"
										onclick="window.open('<%=request.getContextPath()%>/account/accountDelete?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=400px,height=250px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
											�⑨옙�ワ옙占쎈��占�</a></td>
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
							<h3>鈺곌�占쏙옙 占쎈��占쏙옙占쏙옙 占쏙옙占쎈�э옙占쏙옙占�.</h3>
							</br>
							<h4>筌��ο옙占쏙옙占썸에占� 占쏙옙占쎈��占쏙옙 占쎈��占쏙옙! 占쏙옙�룐�ㅿ옙占싼�占쏙옙占쏙옙 占쏙옙�곤옙占쏙옙占쎈�占쏙옙.</h4>
						</div>
						<div class="col-md-3 cta-button">
							<a href="<%=request.getContextPath()%>/finance/financeMain?dbno=3"
								class="btn btn-lg btn-block btn-default">揶�占쏙옙占쏙옙占썸묾占�</a>
						</div>
					</c:if>
					<c:if test="${count3 != 0 }">
						<c:forEach var="article" items="${ccList}">
							<div class="col-md-9 cta-contents">
								<h1 class="cta-title">占쏙옙疫뀐옙 (${count3 })�⑨옙�ワ옙</h1>
								<div class="cta-desc">
									<p>${article.account_num }</p>
									<p>${article.account_name}</p>
									<p>${article.account_alias}</p>
								</div>
							</div>
							<div class="col-md-9 cta-contents">
								<h3>占쏙옙占쏙옙 ${article.balance }占쏙옙</h3>
							</div>
							<div class="col-md-3 cta-button">
								<a href="<%=request.getContextPath() %>/account/accountShow?account_num=${article.account_num}"
									class="btn btn-lg btn-block btn-default">鈺곌�占쏙옙</a>
							</div>
							<div class="col-md-3 button">
								�⑨옙�ワ옙�울옙�깍옙</a>
							</div>
							<table>
								<tr>
									<td class="moreMenu"><a href="URL"
										onclick="window.open('<%=request.getContextPath()%>/account/aliasChange?account_num=${article.account_num}', '_blank', 'top=350px,left=350px,width=460px,height=310px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">�⑨옙�ワ옙
											癰�占쏙�占� �울옙�깍옙</a></td>
									<td class="moreMenu"><a href="URL"
										onclick="window.open('<%=request.getContextPath()%>/account/accountCopy?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=700px,height=450px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
											�⑨옙�ワ옙揶�占쏙옙�쏙옙占쏙옙紐�占쏙옙(占쎈��占싸쇽옙���)</a></td>
									<td class="moreMenu"><a href="URL"
										onclick="window.open('<%=request.getContextPath()%>/account/accountPwChange?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=400px,height=250px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
											�⑨옙�ワ옙��占썼�占썼린占쏙옙紐�占썲��占�</a></td>
									<td class="moreMenu"><a href="URL"
										onclick="window.open('<%=request.getContextPath()%>/account/accountDelete?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=400px,height=250px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
											�⑨옙�ワ옙占쎈��占�</a></td>
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
<h4>��湲�</h4>
<div
   style="border: 3px solid black; margin: 0px 10px 100px; width: 800;">
   <c:if test="${count3 == 0 }">
      <table class="w3-table-all" align="center">
         <tr class="w3-grey">
            <td align="center" width="1000">議고�� �댁���� ���듬����. </br> �ы���� 怨����� ��移�吏� ����
               ��湲��댁��, �� ���ъ�대�쇰�� �ъ����湲��� ��湲��� 留↔꺼���몄��.
            </td>
            <td width="100"><a
               href="<%=request.getContextPath()%>/account/��湲�媛�����湲�"> 媛�����湲�</a></td>
         </tr>
      </table>
   </c:if>
   <table class="w3-table-all" align="center">
      <tr class="w3-grey">
         <td align="center">��湲� (${count3 })怨�醫�</td>
      </tr>
   </table>
   <c:if test="${count3 != 0 }">
      <table class="w3-table-all" align="center">
         <c:forEach var="article" items="${ccList}">
            <tr height="30">
               <td align="center" width="200">${article.account_name}</td>
               <td align="center" width="200">${article.account_num }</td>
               <td align="center" width="150">${article.account_alias }</td>
               <td align="center" width="150">���� ${article.balance }��</td>
              <td width="100"><a
                  href="<%=request.getContextPath() %>/account/accountShow?account_num=${article.account_num}">
                     議고��</a></td></tr>
               <td class="button" width="100">怨�醫�愿�由�</td>
               <tr height="30">
               <td class="moreMenu"><a href="URL"
                  onclick="window.open('<%=request.getContextPath()%>/account/aliasChange?account_num=${article.account_num}', '_blank', 'top=350px,left=350px,width=550px,height=390px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">怨�醫�
                     蹂�紐� 愿�由�</a></td>
               <td class="moreMenu"><a href="URL"
                  onclick="window.open('<%=request.getContextPath()%>/account/accountCopy?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=700px,height=450px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
                     怨�醫�媛��ㅽ���몄��(�듭�μ�щ낯)</a></td>
               <td class="moreMenu"><a href="URL"
                  onclick="window.open('<%=request.getContextPath()%>/account/accountPwChange?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=400px,height=250px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
                  怨�醫�鍮�諛�踰��몃�寃�</a></td>
               <td class="moreMenu"><a href="URL"
                  onclick="window.open('<%=request.getContextPath()%>/account/accountDelete?account_num=${article.account_num}', '_blank', 'top=350px,left=400px,width=400px,height=250px,toolbars=no,scrollbars=no,toolbars=no,status=no'); return false;">
                  怨�醫��댁�</a></td>
            </tr>
         </c:forEach>
      </table>
   </c:if>
</div>
