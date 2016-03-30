/*
 Copyright (c) 2003-2015, CKSource - Frederico Knabben. All rights reserved.
 For licensing, see LICENSE.md or http://ckeditor.com/license
*/
!function(){function e(e){return e.type==CKEDITOR.NODE_TEXT&&0<e.getLength()&&(!a||!e.isReadOnly())}function t(e){return!(e.type==CKEDITOR.NODE_ELEMENT&&e.isBlockBoundary(CKEDITOR.tools.extend({},CKEDITOR.dtd.$empty,CKEDITOR.dtd.$nonEditable)))}function n(n,r){function s(n,a){var i=this,l=new CKEDITOR.dom.walker(n);l.guard=a?t:function(e){!t(e)&&(i._.matchBoundary=!0)},l.evaluator=e,l.breakOnFalse=1,n.startContainer.type==CKEDITOR.NODE_TEXT&&(this.textNode=n.startContainer,this.offset=n.startOffset-1),this._={matchWord:a,walker:l,matchBoundary:!1}}function h(e,t){var a=n.createRange();return a.setStart(e.textNode,t?e.offset:e.offset+1),a.setEndAt(n.editable(),CKEDITOR.POSITION_BEFORE_END),a}function c(e){var t=n.getSelection().getRanges()[0],a=n.editable();return t&&!e?(e=t.clone(),e.collapse(!0)):(e=n.createRange(),e.setStartAt(a,CKEDITOR.POSITION_AFTER_START)),e.setEndAt(a,CKEDITOR.POSITION_BEFORE_END),e}var d=new CKEDITOR.style(CKEDITOR.tools.extend({attributes:{"data-cke-highlight":1},fullMatch:1,ignoreReadonly:1,childRule:function(){return 0}},n.config.find_highlight,!0));s.prototype={next:function(){return this.move()},back:function(){return this.move(!0)},move:function(e){var t=this.textNode;if(null===t)return i.call(this);if(this._.matchBoundary=!1,t&&e&&0<this.offset)this.offset--;else if(t&&this.offset<t.getLength()-1)this.offset++;else{for(t=null;!(t||(t=this._.walker[e?"previous":"next"].call(this._.walker),this._.matchWord&&!t||this._.walker._.end)););this.offset=(this.textNode=t)&&e?t.getLength()-1:0}return i.call(this)}};var g=function(e,t){this._={walker:e,cursors:[],rangeLength:t,highlightRange:null,isMatched:0}};g.prototype={toDomRange:function(){var e=n.createRange(),t=this._.cursors;if(1>t.length){var a=this._.walker.textNode;if(!a)return null;e.setStartAfter(a)}else a=t[0],t=t[t.length-1],e.setStart(a.textNode,a.offset),e.setEnd(t.textNode,t.offset+1);return e},updateFromDomRange:function(e){var t=new s(e);this._.cursors=[];do e=t.next(),e.character&&this._.cursors.push(e);while(e.character);this._.rangeLength=this._.cursors.length},setMatched:function(){this._.isMatched=!0},clearMatched:function(){this._.isMatched=!1},isMatched:function(){return this._.isMatched},highlight:function(){if(!(1>this._.cursors.length)){this._.highlightRange&&this.removeHighlight();var e=this.toDomRange(),t=e.createBookmark();d.applyToRange(e,n),e.moveToBookmark(t),this._.highlightRange=e,t=e.startContainer,t.type!=CKEDITOR.NODE_ELEMENT&&(t=t.getParent()),t.scrollIntoView(),this.updateFromDomRange(e)}},removeHighlight:function(){if(this._.highlightRange){var e=this._.highlightRange.createBookmark();d.removeFromRange(this._.highlightRange,n),this._.highlightRange.moveToBookmark(e),this.updateFromDomRange(this._.highlightRange),this._.highlightRange=null}},isReadOnly:function(){return this._.highlightRange?this._.highlightRange.startContainer.isReadOnly():0},moveBack:function(){var e=this._.walker.back(),t=this._.cursors;return e.hitMatchBoundary&&(this._.cursors=t=[]),t.unshift(e),t.length>this._.rangeLength&&t.pop(),e},moveNext:function(){var e=this._.walker.next(),t=this._.cursors;return e.hitMatchBoundary&&(this._.cursors=t=[]),t.push(e),t.length>this._.rangeLength&&t.shift(),e},getEndCharacter:function(){var e=this._.cursors;return 1>e.length?null:e[e.length-1].character},getNextCharacterRange:function(e){var t,n;return n=this._.cursors,n=(t=n[n.length-1])&&t.textNode?new s(h(t)):this._.walker,new g(n,e)},getCursors:function(){return this._.cursors}};var u=function(e,t){var n=[-1];t&&(e=e.toLowerCase());for(var a=0;a<e.length;a++)for(n.push(n[a]+1);0<n[a+1]&&e.charAt(a)!=e.charAt(n[a+1]-1);)n[a+1]=n[n[a+1]-1]+1;this._={overlap:n,state:0,ignoreCase:!!t,pattern:e}};u.prototype={feedCharacter:function(e){for(this._.ignoreCase&&(e=e.toLowerCase());;){if(e==this._.pattern.charAt(this._.state))return this._.state++,this._.state==this._.pattern.length?(this._.state=0,2):1;if(!this._.state)return 0;this._.state=this._.overlap[this._.state]}},reset:function(){this._.state=0}};var m=/[.,"'?!;: \u0085\u00a0\u1680\u280e\u2028\u2029\u202f\u205f\u3000]/,f=function(e){if(!e)return!0;var t=e.charCodeAt(0);return t>=9&&13>=t||t>=8192&&8202>=t||m.test(e)},p={searchRange:null,matchRange:null,find:function(e,t,a,i,l,o){this.matchRange?(this.matchRange.removeHighlight(),this.matchRange=this.matchRange.getNextCharacterRange(e.length)):this.matchRange=new g(new s(this.searchRange),e.length);for(var r=new u(e,!t),d=0,m="%";null!==m;){for(this.matchRange.moveNext();(m=this.matchRange.getEndCharacter())&&(d=r.feedCharacter(m),2!=d);)this.matchRange.moveNext().hitMatchBoundary&&r.reset();if(2==d){if(a){var p=this.matchRange.getCursors(),b=p[p.length-1],p=p[0],C=n.createRange();if(C.setStartAt(n.editable(),CKEDITOR.POSITION_AFTER_START),C.setEnd(p.textNode,p.offset),p=C,b=h(b),p.trim(),b.trim(),p=new s(p,!0),b=new s(b,!0),!f(p.back().character)||!f(b.next().character))continue}return this.matchRange.setMatched(),!1!==l&&this.matchRange.highlight(),!0}}return this.matchRange.clearMatched(),this.matchRange.removeHighlight(),i&&!o?(this.searchRange=c(1),this.matchRange=null,arguments.callee.apply(this,Array.prototype.slice.call(arguments).concat([!0]))):!1},replaceCounter:0,replace:function(e,t,i,l,o,r,s){if(a=1,e=0,this.matchRange&&this.matchRange.isMatched()&&!this.matchRange._.isReplaced&&!this.matchRange.isReadOnly()){if(this.matchRange.removeHighlight(),t=this.matchRange.toDomRange(),i=n.document.createText(i),!s){var h=n.getSelection();h.selectRanges([t]),n.fire("saveSnapshot")}t.deleteContents(),t.insertNode(i),s||(h.selectRanges([t]),n.fire("saveSnapshot")),this.matchRange.updateFromDomRange(t),s||this.matchRange.highlight(),this.matchRange._.isReplaced=!0,this.replaceCounter++,e=1}else e=this.find(t,l,o,r,!s);return a=0,e}},b=n.lang.find;return{title:b.title,resizable:CKEDITOR.DIALOG_RESIZE_NONE,minWidth:350,minHeight:170,buttons:[CKEDITOR.dialog.cancelButton(n,{label:n.lang.common.close})],contents:[{id:"find",label:b.find,title:b.find,accessKey:"",elements:[{type:"hbox",widths:["230px","90px"],children:[{type:"text",id:"txtFindFind",label:b.findWhat,isChanged:!1,labelLayout:"horizontal",accessKey:"F"},{type:"button",id:"btnFind",align:"left",style:"width:100%",label:b.find,onClick:function(){var e=this.getDialog();p.find(e.getValueOf("find","txtFindFind"),e.getValueOf("find","txtFindCaseChk"),e.getValueOf("find","txtFindWordChk"),e.getValueOf("find","txtFindCyclic"))||alert(b.notFoundMsg)}}]},{type:"fieldset",label:CKEDITOR.tools.htmlEncode(b.findOptions),style:"margin-top:29px",children:[{type:"vbox",padding:0,children:[{type:"checkbox",id:"txtFindCaseChk",isChanged:!1,label:b.matchCase},{type:"checkbox",id:"txtFindWordChk",isChanged:!1,label:b.matchWord},{type:"checkbox",id:"txtFindCyclic",isChanged:!1,"default":!0,label:b.matchCyclic}]}]}]},{id:"replace",label:b.replace,accessKey:"M",elements:[{type:"hbox",widths:["230px","90px"],children:[{type:"text",id:"txtFindReplace",label:b.findWhat,isChanged:!1,labelLayout:"horizontal",accessKey:"F"},{type:"button",id:"btnFindReplace",align:"left",style:"width:100%",label:b.replace,onClick:function(){var e=this.getDialog();p.replace(e,e.getValueOf("replace","txtFindReplace"),e.getValueOf("replace","txtReplace"),e.getValueOf("replace","txtReplaceCaseChk"),e.getValueOf("replace","txtReplaceWordChk"),e.getValueOf("replace","txtReplaceCyclic"))||alert(b.notFoundMsg)}}]},{type:"hbox",widths:["230px","90px"],children:[{type:"text",id:"txtReplace",label:b.replaceWith,isChanged:!1,labelLayout:"horizontal",accessKey:"R"},{type:"button",id:"btnReplaceAll",align:"left",style:"width:100%",label:b.replaceAll,isChanged:!1,onClick:function(){var e=this.getDialog();for(p.replaceCounter=0,p.searchRange=c(1),p.matchRange&&(p.matchRange.removeHighlight(),p.matchRange=null),n.fire("saveSnapshot");p.replace(e,e.getValueOf("replace","txtFindReplace"),e.getValueOf("replace","txtReplace"),e.getValueOf("replace","txtReplaceCaseChk"),e.getValueOf("replace","txtReplaceWordChk"),!1,!0););p.replaceCounter?(alert(b.replaceSuccessMsg.replace(/%1/,p.replaceCounter)),n.fire("saveSnapshot")):alert(b.notFoundMsg)}}]},{type:"fieldset",label:CKEDITOR.tools.htmlEncode(b.findOptions),children:[{type:"vbox",padding:0,children:[{type:"checkbox",id:"txtReplaceCaseChk",isChanged:!1,label:b.matchCase},{type:"checkbox",id:"txtReplaceWordChk",isChanged:!1,label:b.matchWord},{type:"checkbox",id:"txtReplaceCyclic",isChanged:!1,"default":!0,label:b.matchCyclic}]}]}]}],onLoad:function(){var e,t=this,n=0;this.on("hide",function(){n=0}),this.on("show",function(){n=1}),this.selectPage=CKEDITOR.tools.override(this.selectPage,function(a){return function(i){a.call(t,i);var r,s=t._.tabs[i];if(r="find"===i?"txtFindWordChk":"txtReplaceWordChk",e=t.getContentElement(i,"find"===i?"txtFindFind":"txtFindReplace"),t.getContentElement(i,r),s.initialized||(CKEDITOR.document.getById(e._.inputId),s.initialized=!0),n){var h;i="find"===i?1:0;var c,s=1-i,d=o.length;for(c=0;d>c;c++)r=this.getContentElement(l[i],o[c][i]),h=this.getContentElement(l[s],o[c][s]),h.setValue(r.getValue())}}})},onShow:function(){p.searchRange=c();var e=this.getParentEditor().getSelection().getSelectedText(),t=this.getContentElement(r,"find"==r?"txtFindFind":"txtFindReplace");t.setValue(e),t.select(),this.selectPage(r),this[("find"==r&&this._.editor.readOnly?"hide":"show")+"Page"]("replace")},onHide:function(){var e;p.matchRange&&p.matchRange.isMatched()&&(p.matchRange.removeHighlight(),n.focus(),(e=p.matchRange.toDomRange())&&n.getSelection().selectRanges([e])),delete p.matchRange},onFocus:function(){return"replace"==r?this.getContentElement("replace","txtFindReplace"):this.getContentElement("find","txtFindFind")}}}var a,i=function(){return{textNode:this.textNode,offset:this.offset,character:this.textNode?this.textNode.getText().charAt(this.offset):null,hitMatchBoundary:this._.matchBoundary}},l=["find","replace"],o=[["txtFindFind","txtFindReplace"],["txtFindCaseChk","txtReplaceCaseChk"],["txtFindWordChk","txtReplaceWordChk"],["txtFindCyclic","txtReplaceCyclic"]];CKEDITOR.dialog.add("find",function(e){return n(e,"find")}),CKEDITOR.dialog.add("replace",function(e){return n(e,"replace")})}();