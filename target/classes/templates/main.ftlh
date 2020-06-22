<#import "parts/common.ftlh" as c>
<@c.page>
<div class="form-row">
    <div class="form-group col-md-6">
        <h5>Search</h5>
        <form action="/main" method="get" class="form-inline">
            <input type="text" name="filter" class="form-control" value="${filter?if_exists}" placeholder="Search by Tag"/>
            <button type="submit" class="btn btn-primary ml-2">Search</button>
        </form>
    </div>
</div>

    <div>
        <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
            Add Message
        </a>
        <div class="collapse <#if message??>show</#if>" id="collapseExample">
            <div class="form-group mt-3">
                <form method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <input type="text" name="text" class="form-control ${(textError??)?string('is-invalid','')}"
                               value="<#if message?? >${message.text}</#if>" placeholder="Введите сообщение"/>
                        <#if textError??>
                            <div class="invalid-feedback">
                                ${textError}
                            </div>
                        </#if>
                    </div>


                    <div class="form-group">
                        <input type="text" name="tag" value="<#if message??>${message.tag}</#if>" class="form-control" placeholder="Тэг"/>
                        <#if tagError??>
                            <div class="invalid-feedback">
                                ${tagError}
                            </div>
                        </#if>
                    </div>
                    <div class="form-group">
                        <div class="custom-file">
                            <input type="file" name="file" id="customFile">
                            <label class="custom-file-label" for="customFile">Choose file</label>
                        </div>

                    </div>


                    <button type="submit" class="btn btn-primary mt-2">Добавить</button>
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                </form>
            </div>
        </div>
    </div>


    <h5>Список сообщений</h5>
    <div class="card-columns">
        <#list messages as message>
            <div class="card my-3" style="width: 18rem;">
                <#if message.filename??>
                    <img src="/img/${message.filename}" class="card-img-top">
                </#if>
                <div class="m-2">
                    <span>${message.text}</span>
                    <i>${message.tag}</i>
                </div>
                <div class="card-footer text-muted">
                    ${message.authorName}
                </div>

            </div>

        <#else>
            No messages
        </#list>
    </div>


</@c.page>

