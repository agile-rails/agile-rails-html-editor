/**
 * @license Copyright (c) 2003-2022, CKSource Holding sp. z o.o. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';

    config.extraAllowedContent     = ['span(*)','button[name]']
    config.removePlugins = ['iframe', 'forms', 'exportpdf', 'scayt', 'a11yhelp'];
    config.removeButtons = 'NewPage,Preview,Print,Templates,Strike,Superscript,Subscript,' +
        'CopyFormatting,Blockquote,BidiLtr,BidiRtl,Language,Smiley,SpecialChar,PageBreak,Paste,PasteText,PasteFromWord';
};
