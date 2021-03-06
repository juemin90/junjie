<%@ page import="cn.com.agilemaster.Message" %>
<div class="row-fluid">
    <g:link class="btn btn-small btn-primary" action="create"><i class="halflings-icon edit"></i>发信息</g:link>
    <g:link class="btn btn-small btn-primary" action="create"><i class="halflings-icon edit"></i>回复</g:link>
    <g:link class="btn btn-small btn-primary" action="create"><i class="halflings-icon edit"></i>转发信息</g:link>
    <g:link class="btn btn-small btn-primary" action="create"><i class="halflings-icon edit"></i>删除信息</g:link>
</div>
<hr/>
<table class="table bootstrap-datatable datatable messagesList">
    <thead><tr>
        <th><input type="checkbox"></th>
        <th class="from">来自</th>
        <th>主题</th>
        <th>时间</th>
        <th>操作</th>
    </tr></thead>
    <tbody>
    <g:render template="messageEntry"
              collection="${cn.com.agilemaster.MessageRecipient.findAllByRecipient(session.currentUser)?.collect {it.message}}"
              var="message"/>
    </tbody>
</table>

<div id="errorDiv">
    <h2>ErrorDiv</h2>
    <ul>
    <g:each in="${cn.com.agilemaster.Message.list()}" var="msg">
             <li>${msg.tags}</li>
    </g:each>
        </ul>
</div>


<div class="clearfix"></div>
<r:script>
    $(document).delegate("a.replyBtn", 'click', function (event, data) {

    });


</r:script>