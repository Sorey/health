CKEDITOR.editorConfig = function (config) {
    // ... other configuration ...

    config.toolbar_mini = [
        ["Font","FontSize"],
        ["TextColor","BGColor"],
        //["Undo","Redo","-","Find","Replace","-","SelectAll","RemoveFormat"],
        ["Bold","Italic","Underline","Strike","-","Subscript","Superscript"],
        //["NumberedList","BulletedList","-","Outdent","Indent"],
        ["JustifyLeft","JustifyCenter","JustifyRight","JustifyBlock"],
        ["Link","Unlink"],
        //["Image","Table","HorizontalRule"],
        //["Styles","Format","Font","FontSize"],
    ];
    config.toolbar = "simple";

    // ... rest of the original config.js  ...
}

//CKEDITOR.editorConfig = function( config )
//{
//    config.toolbar_MyToolbar =
//        [
//            { name: 'document', items : [ 'NewPage','Preview' ] },
//            { name: 'clipboard', items : [ 'Cut','Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo' ] },
//            { name: 'editing', items : [ 'Find','Replace','-','SelectAll','-','Scayt' ] },
//            { name: 'insert', items : [ 'Image','Flash','Table','HorizontalRule','Smiley','SpecialChar','PageBreak'
//                ,'Iframe' ] },
//            '/',
//            { name: 'styles', items : [ 'Styles','Format' ] },
//            { name: 'basicstyles', items : [ 'Bold','Strike','-','RemoveFormat' ] },
//            { name: 'paragraph', items : [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote' ] },
//            { name: 'links', items : [ 'Link','Unlink','Anchor' ] },
//            { name: 'tools', items : [ 'Maximize','-','About' ] }
//        ];
//}