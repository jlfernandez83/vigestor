/**
 * @license Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
  config.toolbar_Personal =
  [
    { name: 'clipboard',   items : [ 'Cut','Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo' ] },
    { name: 'editing',     items : [ 'Find','Replace','-','SelectAll','-','SpellChecker', 'Scayt' ] },
    
    '/',
    { name: 'basicstyles', items : [ 'Bold','Italic','Underline','Strike','Subscript','Superscript','-','RemoveFormat' ] },
    { name: 'paragraph',   items : [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote','-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'
] },
    { name: 'links',       items : [ 'Link','Unlink','Anchor' ] },
    { name: 'insert',      items : [ 'Table','SpecialChar' ] },
    '/',
    { name: 'styles',      items : [ 'Format','Font','FontSize' ] },
    { name: 'colors',      items : [ 'TextColor','BGColor' ] },
    { name: 'tools',       items : [ 'Maximize', 'ShowBlocks'] }
  ];
  config.toolbar = 'Personal';
};
