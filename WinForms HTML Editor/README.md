# WinForms HTML Editor
## Requires
- Visual Studio 2010
## License
- MS-LPL
## Technologies
- Windows Forms
## Topics
- HTML Editor
## Updated
- 10/25/2011
## Description

<p>The purpose of the Html Editor is to provide Html Editing capabilities within a WinForms control. The control should emulate the operations that are available within a Rich Text control, but have information persisted and restored from an Html BODY element.</p>
<h2><a name="_Toc43806133">Html Editor Goals</a></h2>
<p><br>
The purpose of the Html Editor is to provide a control that allows for Html editing satisfying the requirements of input for rich text layouts and simple portal type information. Examples of the former are case where the Rich Text control would normally be
 utilized; documentation, complex descriptions where text formatting is required, correspondences, bulletins, etc. Examples of the latter case are such items as dashboards; news clips, announcements, company references, etc. These are defined by cases where
 complex layouts are required that may include images and links.</p>
<p><br>
High level design goals are:</p>
<ol>
<li>Provides robust WYSIWYG editing capabilities whose contents are persisted in HTML format.
</li><li>Is easily reusable in other projects. </li><li>Provides methods for saving HTML files to and loading files from disk (with the appropriate security demands).
</li></ol>
<p>The basic operations of the control are thus defined as:</p>
<h3><br>
Standard Text Editing</h3>
<ol>
<li><em>&nbsp;</em>Support basic formatting commands such as Bold, Italic, Underline, Strikeout, Font Name, Font Size, Font Color, Justification (Left, Right, and Center), Bullets and Number Lists. Dialogs should be presented to the user for modifying Font
 and Color attributes. </li><li>Provide for standard Cut, Copy, Paste, Undo, Redo, Select All, and commands. </li><li>Allow for the inserting and removing indentation. </li><li>Allow the inclusion of images along with alternative text and text alignment options.
</li><li>Allow for the insertion of web links (Anchor tags), including the definition of the target frame.
</li><li>Allow for the insertion of a horizontal line for text separation. </li><li><span style="font-size:7pt">P</span>rovide a Find and Replace mechanisms. This dialog should highlight the appropriate text upon a find, and support a Replace All operation.
</li><li>Provide an integrated toolbar to perform the standard text editing functions, and other essential functions (as listed in the above points).
</li><li>Allow for the Insert mode (overwrite), word wrapping options to be toggled, and the visibility of scroll bars to be defined.
</li><li>Allow the use of context menus that include all the required text formatting commands. The context menu should be sensitive to the user&rsquo;s selection.
</li><li>Allow for the insert, removal, and property definition of tables. </li></ol>
<h3><br>
Body Properties</h3>
<ol>
<li>Have the ability to simply set the text of the document body, the inner text of an Html Document; a browsable designer property.
</li><li>Allow for the assignment of the complete Body element (Body outer Html), preserving and body properties. Also allow for the
<br>
assignment of the Body contents, Body inner Html. </li><li>Support the inclusion of Headings and Formatted blocks of text. This operation should be able to be performed in reverse; set to
<br>
Normal style. </li><li>Have the ability to define the default body background and foreground colors.
</li><li>Allow for the ability of the Html content to be viewed or edited directly. </li><li>Allow for the pasting of Text and Html Markup. </li></ol>
<h3>External Behavior</h3>
<ol>
<li>Allow a reference to a stylesheet to be applied to the document at runtime. The purpose is to allow the definition of a corporate wide stylesheet that all documents should reference for standardizing fonts, colors, etc.
</li><li>Allow a reference to a script source file to be applied to the document at runtime. The purpose is to allow the use of a corporate script file that can be used for handling links requiring programmatic redirection.
</li><li>Allow for the ability to ensure all links are forwarded to a new browser window; and not rendered within the window containing
<br>
the original link. </li><li>Allow a document to be loaded by a given URL. </li></ol>
<h3><br>
HTML Editor Non Goals</h3>
<p>The Html Editor is not designed to provide similar functionality to Html Editor Products. For complex layout requiring Styles, Absolute Positing, Frames, Multi-Media, etc, these products should be utilized.</p>
<p>Operations that the control does not support are thus defined as:</p>
<ol>
<li>Support is only included for a single Font selection and not Font Families. </li><li>Support for 2D-Position, Absolute Position, and Live Resize is not included. </li><li>Multiple Selections of items is not supported and all operations are based on a single selected control.
</li><li>Simple Font properties are used rather than style attributes. The inclusion of style attributes brings around complexity regarding the use of Span tags.
</li><li>There was the option to have the control be Tab driven; supporting Design, Edit Html, and Preview. This would then have made the control look more like a fully-functional Html editor rather than a replacement to the Rich Text Box.
</li></ol>
<p>Here is a complete set of documentation:</p>
<p><a id="25710" href="/site/view/file/25710/1/Html%20Editor%20Application.pdf">Html Editor Application.pdf</a></p>
<p>Here is the C# Public API</p>
<p>&nbsp;</p>
<div class="scriptcode">
<div class="pluginEditHolder" pluginCommand="mceScriptCode">
<div class="title"><span>C#</span></div>
<div class="pluginLinkHolder"><span class="pluginEditHolderLink">Edit</span>|<span class="pluginRemoveHolderLink">Remove</span></div>
<span class="hidden">csharp</span>

<div class="preview">
<pre class="csharp"><span class="cs__keyword">using</span>&nbsp;HtmlDocument&nbsp;=&nbsp;mshtml.HTMLDocument;&nbsp;
<span class="cs__keyword">using</span>&nbsp;HtmlBody&nbsp;=&nbsp;mshtml.HTMLBody;&nbsp;
<span class="cs__keyword">using</span>&nbsp;HtmlStyleSheet&nbsp;=&nbsp;mshtml.IHTMLStyleSheet;&nbsp;
<span class="cs__keyword">using</span>&nbsp;HtmlStyle&nbsp;=&nbsp;mshtml.IHTMLStyle;&nbsp;
<span class="cs__keyword">using</span>&nbsp;HtmlDomNode&nbsp;=&nbsp;mshtml.IHTMLDOMNode;&nbsp;
<span class="cs__keyword">using</span>&nbsp;HtmlDomTextNode&nbsp;=&nbsp;mshtml.IHTMLDOMTextNode;&nbsp;
<span class="cs__keyword">using</span>&nbsp;HtmlTextRange&nbsp;=&nbsp;mshtml.IHTMLTxtRange;&nbsp;
<span class="cs__keyword">using</span>&nbsp;HtmlSelection&nbsp;=&nbsp;mshtml.IHTMLSelectionObject;&nbsp;
<span class="cs__keyword">using</span>&nbsp;HtmlControlRange&nbsp;=&nbsp;mshtml.IHTMLControlRange;&nbsp;
&nbsp;
<span class="cs__keyword">using</span>&nbsp;HtmlEventObject&nbsp;=&nbsp;mshtml.IHTMLEventObj;&nbsp;
&nbsp;
<span class="cs__keyword">using</span>&nbsp;HtmlElement&nbsp;=&nbsp;mshtml.IHTMLElement;&nbsp;
<span class="cs__keyword">using</span>&nbsp;HtmlElementCollection&nbsp;=&nbsp;mshtml.IHTMLElementCollection;&nbsp;
<span class="cs__keyword">using</span>&nbsp;HtmlControlElement&nbsp;=&nbsp;mshtml.IHTMLControlElement;&nbsp;
<span class="cs__keyword">using</span>&nbsp;HtmlAnchorElement&nbsp;=&nbsp;mshtml.IHTMLAnchorElement;&nbsp;
<span class="cs__keyword">using</span>&nbsp;HtmlImageElement&nbsp;=&nbsp;mshtml.IHTMLImgElement;&nbsp;
<span class="cs__keyword">using</span>&nbsp;HtmlFontElement=&nbsp;mshtml.IHTMLFontElement;&nbsp;
<span class="cs__keyword">using</span>&nbsp;HtmlLineElement&nbsp;=&nbsp;mshtml.IHTMLHRElement;&nbsp;
<span class="cs__keyword">using</span>&nbsp;HtmlSpanElement&nbsp;=&nbsp;mshtml.IHTMLSpanFlow;&nbsp;
<span class="cs__keyword">using</span>&nbsp;HtmlScriptElement&nbsp;=&nbsp;mshtml.IHTMLScriptElement;&nbsp;
&nbsp;
<span class="cs__keyword">using</span>&nbsp;HtmlTable&nbsp;=&nbsp;mshtml.IHTMLTable;&nbsp;
<span class="cs__keyword">using</span>&nbsp;HtmlTableCaption&nbsp;=&nbsp;mshtml.IHTMLTableCaption;&nbsp;
<span class="cs__keyword">using</span>&nbsp;HtmlTableRow&nbsp;=&nbsp;mshtml.IHTMLTableRow;&nbsp;
<span class="cs__keyword">using</span>&nbsp;HtmlTableCell&nbsp;=&nbsp;mshtml.IHTMLTableCell;&nbsp;
<span class="cs__keyword">using</span>&nbsp;HtmlTableRowMetrics&nbsp;=&nbsp;mshtml.IHTMLTableRowMetrics;&nbsp;
<span class="cs__keyword">using</span>&nbsp;HtmlTableColumn&nbsp;=&nbsp;mshtml.IHTMLTableCol;&nbsp;
&nbsp;
&nbsp;
<span class="cs__com">//&nbsp;UserControl&nbsp;class&nbsp;for&nbsp;the&nbsp;HtmlEditor</span>&nbsp;
<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">sealed</span>&nbsp;<span class="cs__keyword">class</span>&nbsp;HtmlEditorControl&nbsp;:&nbsp;UserControl&nbsp;
{&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;public&nbsp;event&nbsp;raised&nbsp;if&nbsp;an&nbsp;processing&nbsp;exception&nbsp;is&nbsp;found</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;[Category(<span class="cs__string">&quot;Exception&quot;</span>),&nbsp;
Description(<span class="cs__string">&quot;An&nbsp;Internal&nbsp;Processing&nbsp;Exception&nbsp;was&nbsp;encountered&quot;</span>)]&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">event</span>&nbsp;HtmlExceptionEventHandler&nbsp;HtmlException;&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;public&nbsp;control&nbsp;constructor</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;HtmlEditorControl();&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;create&nbsp;a&nbsp;new&nbsp;focus&nbsp;method&nbsp;that&nbsp;ensure&nbsp;the&nbsp;body&nbsp;gets&nbsp;the&nbsp;focus</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;should&nbsp;be&nbsp;called&nbsp;when&nbsp;text&nbsp;processing&nbsp;command&nbsp;are&nbsp;called</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">new</span>&nbsp;<span class="cs__keyword">bool</span>&nbsp;Focus();&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;Runtime&nbsp;Display&nbsp;Properties</span>&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;defines&nbsp;the&nbsp;whether&nbsp;scroll&nbsp;bars&nbsp;should&nbsp;be&nbsp;displayed</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;[Category(<span class="cs__string">&quot;RuntimeDisplay&quot;</span>),&nbsp;
Description(<span class="cs__string">&quot;Controls&nbsp;the&nbsp;Display&nbsp;of&nbsp;Scrolls&nbsp;Bars&quot;</span>)]&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;[DefaultValue(DisplayScrollBarOption.Auto)]&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;DisplayScrollBarOption&nbsp;ScrollBars;&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;defines&nbsp;the&nbsp;whether&nbsp;words&nbsp;will&nbsp;be&nbsp;auto&nbsp;wrapped</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;[Category(<span class="cs__string">&quot;RuntimeDisplay&quot;</span>),&nbsp;
Description(<span class="cs__string">&quot;Controls&nbsp;the&nbsp;auto&nbsp;wrapping&nbsp;of&nbsp;words&quot;</span>)]&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;[DefaultValue(<span class="cs__keyword">true</span>)]&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">bool</span>&nbsp;AutoWordWrap;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;defines&nbsp;the&nbsp;default&nbsp;action&nbsp;when&nbsp;a&nbsp;user&nbsp;click&nbsp;on&nbsp;a&nbsp;link</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;[Category(<span class="cs__string">&quot;RuntimeDisplay&quot;</span>),&nbsp;
Description(<span class="cs__string">&quot;Window&nbsp;to&nbsp;use&nbsp;when&nbsp;clicking&nbsp;a&nbsp;Href&quot;</span>)]&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;[DefaultValue(NavigateActionOption.NewWindow)]&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;NavigateActionOption&nbsp;NavigateAction;&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;Defines&nbsp;the&nbsp;editable&nbsp;status&nbsp;of&nbsp;the&nbsp;text</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;[Category(<span class="cs__string">&quot;RuntimeDisplay&quot;</span>),&nbsp;
Description(<span class="cs__string">&quot;Marks&nbsp;the&nbsp;content&nbsp;as&nbsp;ReadOnly&quot;</span>)]&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;[DefaultValue(<span class="cs__keyword">true</span>)]&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">bool</span>&nbsp;ReadOnly;&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;defines&nbsp;the&nbsp;visibility&nbsp;of&nbsp;the&nbsp;defined&nbsp;toolbar</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;[Category(<span class="cs__string">&quot;RuntimeDisplay&quot;</span>),&nbsp;
Description(<span class="cs__string">&quot;Marks&nbsp;the&nbsp;toolbar&nbsp;as&nbsp;Visible&quot;</span>)]&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;[DefaultValue(<span class="cs__keyword">true</span>)]&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">bool</span>&nbsp;ToolbarVisible;&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;defines&nbsp;the&nbsp;flat&nbsp;style&nbsp;of&nbsp;controls&nbsp;for&nbsp;visual&nbsp;styles</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;[Category(<span class="cs__string">&quot;RuntimeDisplay&quot;</span>),&nbsp;
Description(<span class="cs__string">&quot;Indicates&nbsp;if&nbsp;Control&nbsp;Flat&nbsp;Style&nbsp;is&nbsp;System&quot;</span>)]&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;[DefaultValue(<span class="cs__keyword">false</span>)]&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">bool</span>&nbsp;EnableVisualStyles;&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;defines&nbsp;the&nbsp;visibility&nbsp;of&nbsp;the&nbsp;defined&nbsp;toolbar</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;[Category(<span class="cs__string">&quot;RuntimeDisplay&quot;</span>),&nbsp;
Description(<span class="cs__string">&quot;Defines&nbsp;the&nbsp;docking&nbsp;location&nbsp;of&nbsp;the&nbsp;toolbar&quot;</span>)]&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;[DefaultValue(DockStyle.Bottom)]&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;DockStyle&nbsp;ToolbarDock;&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;Body&nbsp;Properties&nbsp;(Text&nbsp;and&nbsp;HTML)</span>&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;defines&nbsp;the&nbsp;base&nbsp;text&nbsp;for&nbsp;the&nbsp;body&nbsp;(design&nbsp;time&nbsp;only&nbsp;value)</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;HTML&nbsp;value&nbsp;can&nbsp;be&nbsp;used&nbsp;at&nbsp;runtime</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;[Category(<span class="cs__string">&quot;Textual&quot;</span>),&nbsp;
Description(<span class="cs__string">&quot;Set&nbsp;the&nbsp;initial&nbsp;Body&nbsp;Text&quot;</span>)]&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;[DefaultValue(<span class="cs__string">&quot;Html&quot;</span>)]&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">string</span>&nbsp;InnerText;&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;the&nbsp;HTML&nbsp;value&nbsp;for&nbsp;the&nbsp;body&nbsp;contents</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;it&nbsp;is&nbsp;this&nbsp;value&nbsp;that&nbsp;gets&nbsp;serialized&nbsp;by&nbsp;the&nbsp;designer</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;[Category(<span class="cs__string">&quot;Textual&quot;</span>),&nbsp;
Description(<span class="cs__string">&quot;The&nbsp;Inner&nbsp;HTML&nbsp;of&nbsp;the&nbsp;contents&quot;</span>)]&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;[DesignerSerializationVisibility&nbsp;
(DesignerSerializationVisibility.Hidden),Browsable(<span class="cs__keyword">false</span>)]&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">string</span>&nbsp;InnerHtml;&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;returns&nbsp;and&nbsp;sets&nbsp;the&nbsp;body&nbsp;tag&nbsp;of&nbsp;the&nbsp;html</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;on&nbsp;set&nbsp;the&nbsp;body&nbsp;attributes&nbsp;need&nbsp;to&nbsp;be&nbsp;defined</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;[Category(<span class="cs__string">&quot;Textual&quot;</span>),&nbsp;
Description(<span class="cs__string">&quot;Complete&nbsp;Document&nbsp;including&nbsp;Body&nbsp;Tag&quot;</span>)]&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;[DesignerSerializationVisibility&nbsp;
(DesignerSerializationVisibility.Hidden),&nbsp;Browsable(<span class="cs__keyword">false</span>)]&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">string</span>&nbsp;BodyHtml;&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;return&nbsp;the&nbsp;html&nbsp;tag&nbsp;of&nbsp;the&nbsp;document</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;should&nbsp;never&nbsp;be&nbsp;set&nbsp;as&nbsp;contains&nbsp;the&nbsp;HEAD&nbsp;tag</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;[Category(<span class="cs__string">&quot;Textual&quot;</span>),&nbsp;
Description(<span class="cs__string">&quot;Complete&nbsp;Document&nbsp;including&nbsp;Head&nbsp;and&nbsp;Body&quot;</span>)]&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;[DesignerSerializationVisibility&nbsp;
(DesignerSerializationVisibility.Hidden),&nbsp;Browsable(<span class="cs__keyword">false</span>)]&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">string</span>&nbsp;DocumentHtml;&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;Body&nbsp;Properties&nbsp;(Font&nbsp;and&nbsp;Color)</span>&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;body&nbsp;background&nbsp;color</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;reset&nbsp;and&nbsp;serialize&nbsp;values&nbsp;defined</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;[Category(<span class="cs__string">&quot;Textual&quot;</span>),&nbsp;
Description(<span class="cs__string">&quot;Define&nbsp;the&nbsp;Background&nbsp;Color&nbsp;of&nbsp;the&nbsp;Body&quot;</span>)]&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;Color&nbsp;BodyBackColor;&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;body&nbsp;foreground&nbsp;color</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;reset&nbsp;and&nbsp;serialize&nbsp;values&nbsp;defined</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;[Category(<span class="cs__string">&quot;Textual&quot;</span>),&nbsp;
Description(<span class="cs__string">&quot;Define&nbsp;the&nbsp;Foreground&nbsp;Color&nbsp;of&nbsp;the&nbsp;Body&quot;</span>)]&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;Color&nbsp;BodyForeColor;&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;body&nbsp;font&nbsp;definition</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;always&nbsp;set&nbsp;based&nbsp;on&nbsp;the&nbsp;controls&nbsp;font</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;[Category(<span class="cs__string">&quot;Textual&quot;</span>),&nbsp;
Description(<span class="cs__string">&quot;Defines&nbsp;the&nbsp;base&nbsp;font&nbsp;name&nbsp;for&nbsp;the&nbsp;text&quot;</span>)]&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;HtmlFontProperty&nbsp;BodyFont;&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;returns&nbsp;or&nbsp;sets&nbsp;the&nbsp;Text&nbsp;selected&nbsp;by&nbsp;the&nbsp;user</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;[Category(<span class="cs__string">&quot;Textual&quot;</span>),&nbsp;
Description(<span class="cs__string">&quot;The&nbsp;Text&nbsp;selected&nbsp;by&nbsp;the&nbsp;User&quot;</span>)]&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;[DesignerSerializationVisibility&nbsp;
(DesignerSerializationVisibility.Hidden),&nbsp;Browsable(<span class="cs__keyword">false</span>)]&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">string</span>&nbsp;SelectedText;&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;returns&nbsp;or&nbsp;sets&nbsp;the&nbsp;Html&nbsp;selected&nbsp;by&nbsp;the&nbsp;user</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;[Category(<span class="cs__string">&quot;Textual&quot;</span>),&nbsp;
&nbsp;Description(<span class="cs__string">&quot;The&nbsp;Text&nbsp;selected&nbsp;by&nbsp;the&nbsp;User&quot;</span>)]&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;[DesignerSerializationVisibility&nbsp;
(DesignerSerializationVisibility.Hidden),&nbsp;Browsable(<span class="cs__keyword">false</span>)]&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">string</span>&nbsp;SelectedHtml;&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;returns&nbsp;any&nbsp;Url&nbsp;that&nbsp;was&nbsp;used&nbsp;to&nbsp;load&nbsp;the&nbsp;current&nbsp;document</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;[Category(<span class="cs__string">&quot;Textual&quot;</span>),&nbsp;
Description(<span class="cs__string">&quot;Url&nbsp;used&nbsp;to&nbsp;load&nbsp;the&nbsp;Document&quot;</span>)]&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;[DesignerSerializationVisibility&nbsp;
(DesignerSerializationVisibility.Hidden),&nbsp;Browsable(<span class="cs__keyword">false</span>)]&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">string</span>&nbsp;DocumentUrl&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;Document&nbsp;Processing&nbsp;Operations</span>&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;allow&nbsp;the&nbsp;user&nbsp;to&nbsp;select&nbsp;a&nbsp;file&nbsp;and&nbsp;read&nbsp;the&nbsp;contents</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;OpenFilePrompt()&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;allow&nbsp;the&nbsp;user&nbsp;to&nbsp;persist&nbsp;the&nbsp;Html&nbsp;stream&nbsp;to&nbsp;a&nbsp;file</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;SaveFilePrompt()&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;allow&nbsp;the&nbsp;user&nbsp;to&nbsp;load&nbsp;a&nbsp;document&nbsp;by&nbsp;navigation</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;NavigateToUrl(<span class="cs__keyword">string</span>&nbsp;url);&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;allow&nbsp;the&nbsp;user&nbsp;to&nbsp;load&nbsp;a&nbsp;document&nbsp;by&nbsp;url</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;LoadFromUrl(<span class="cs__keyword">string</span>&nbsp;url);&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;allow&nbsp;a&nbsp;user&nbsp;to&nbsp;load&nbsp;a&nbsp;file&nbsp;given&nbsp;a&nbsp;file&nbsp;name</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;LoadFromFile(<span class="cs__keyword">string</span>&nbsp;filename);&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;define&nbsp;the&nbsp;style&nbsp;sheet&nbsp;to&nbsp;be&nbsp;used&nbsp;for&nbsp;editing</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;can&nbsp;be&nbsp;used&nbsp;for&nbsp;standard&nbsp;templates</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;LinkStyleSheet(<span class="cs__keyword">string</span>&nbsp;stylesheetHref);&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;return&nbsp;to&nbsp;the&nbsp;user&nbsp;the&nbsp;style&nbsp;sheet&nbsp;href&nbsp;being&nbsp;used</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">string</span>&nbsp;GetStyleSheetHref();&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;define&nbsp;a&nbsp;script&nbsp;element&nbsp;that&nbsp;is&nbsp;to&nbsp;be&nbsp;used&nbsp;by&nbsp;all&nbsp;documents</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;can&nbsp;be&nbsp;sued&nbsp;for&nbsp;document&nbsp;processing</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;LinkScriptSource(<span class="cs__keyword">string</span>&nbsp;scriptSource);&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;return&nbsp;to&nbsp;the&nbsp;user&nbsp;the&nbsp;script&nbsp;block&nbsp;source&nbsp;being&nbsp;used</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">string</span>&nbsp;GetScriptBlockSource();&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;allow&nbsp;the&nbsp;user&nbsp;to&nbsp;edit&nbsp;the&nbsp;raw&nbsp;HTML</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;dialog&nbsp;presented&nbsp;and&nbsp;the&nbsp;body&nbsp;contents&nbsp;set</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;HtmlContentsEdit();&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;allow&nbsp;the&nbsp;user&nbsp;to&nbsp;view&nbsp;the&nbsp;html&nbsp;contents</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;the&nbsp;complete&nbsp;Html&nbsp;markup&nbsp;is&nbsp;presented</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;HtmlContentsView();&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;print&nbsp;the&nbsp;html&nbsp;text&nbsp;using&nbsp;the&nbsp;document&nbsp;print&nbsp;command</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;print&nbsp;preview&nbsp;is&nbsp;not&nbsp;supported</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;DocumentPrint();&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;toggle&nbsp;the&nbsp;overwrite&nbsp;mode</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;ToggleOverWrite();&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;Document&nbsp;Text&nbsp;Operations</span>&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;cut&nbsp;the&nbsp;currently&nbsp;selected&nbsp;text&nbsp;to&nbsp;the&nbsp;clipboard</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;TextCut();&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;copy&nbsp;the&nbsp;currently&nbsp;selected&nbsp;text&nbsp;to&nbsp;the&nbsp;clipboard</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;TextCopy();&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;paste&nbsp;the&nbsp;currently&nbsp;selected&nbsp;text&nbsp;from&nbsp;the&nbsp;clipboard</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;TextPaste();&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;delete&nbsp;the&nbsp;currently&nbsp;selected&nbsp;text&nbsp;from&nbsp;the&nbsp;screen</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;TextDelete();&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;select&nbsp;the&nbsp;entire&nbsp;document&nbsp;contents</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;TextSelectAll();&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;clear&nbsp;the&nbsp;document&nbsp;selection</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;TextClearSelect();&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;undo&nbsp;former&nbsp;commands</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;EditUndo();&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;redo&nbsp;former&nbsp;undo</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;EditRedo();&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;Selected&nbsp;Text&nbsp;Formatting&nbsp;Operations</span>&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;using&nbsp;the&nbsp;document&nbsp;set&nbsp;the&nbsp;font&nbsp;name</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;FormatFontName(<span class="cs__keyword">string</span>&nbsp;name);&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;using&nbsp;the&nbsp;document&nbsp;set&nbsp;the&nbsp;Html&nbsp;font&nbsp;size</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;FormatFontSize(HtmlFontSize&nbsp;size);&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;using&nbsp;the&nbsp;document&nbsp;toggles&nbsp;selection&nbsp;with&nbsp;a&nbsp;Bold&nbsp;tag</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;FormatBold();&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;using&nbsp;the&nbsp;document&nbsp;toggles&nbsp;selection&nbsp;with&nbsp;a&nbsp;Underline&nbsp;tag</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;FormatUnderline();&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;using&nbsp;the&nbsp;document&nbsp;toggles&nbsp;selection&nbsp;with&nbsp;a&nbsp;Italic&nbsp;tag</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;FormatItalic();&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;using&nbsp;the&nbsp;document&nbsp;toggles&nbsp;selection&nbsp;with&nbsp;a&nbsp;Subscript&nbsp;tag</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;FormatSubscript();&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;using&nbsp;the&nbsp;document&nbsp;toggles&nbsp;selection&nbsp;with&nbsp;a&nbsp;Superscript&nbsp;tag</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;FormatSuperscript();&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;using&nbsp;the&nbsp;document&nbsp;toggles&nbsp;selection&nbsp;with&nbsp;a&nbsp;Strikeout&nbsp;tag</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;FormatStrikeout();&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;increase&nbsp;the&nbsp;size&nbsp;of&nbsp;the&nbsp;font&nbsp;by&nbsp;1&nbsp;point</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;FormatFontIncrease();&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;decrease&nbsp;the&nbsp;size&nbsp;of&nbsp;the&nbsp;font&nbsp;by&nbsp;1&nbsp;point</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;FormatFontDecrease();&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;remove&nbsp;any&nbsp;formatting&nbsp;tags</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;FormatRemove();&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;Tab&nbsp;the&nbsp;current&nbsp;line&nbsp;to&nbsp;the&nbsp;right</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;FormatTabRight();&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;Tab&nbsp;the&nbsp;current&nbsp;line&nbsp;to&nbsp;the&nbsp;left</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;FormatTabLeft();&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;insert&nbsp;a&nbsp;ordered&nbsp;or&nbsp;unordered&nbsp;list</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;FormatList(HtmlListType&nbsp;listtype);&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;define&nbsp;the&nbsp;font&nbsp;justification&nbsp;as&nbsp;LEFT</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;JustifyLeft();&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;define&nbsp;the&nbsp;font&nbsp;justification&nbsp;as&nbsp;CENTER</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;JustifyCenter();&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;define&nbsp;the&nbsp;font&nbsp;justification&nbsp;as&nbsp;Right</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;JustifyRight();&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;Object&nbsp;Insert&nbsp;Operations</span>&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;insert&nbsp;a&nbsp;horizontal&nbsp;line&nbsp;in&nbsp;the&nbsp;body</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;InsertLine();&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;insert&nbsp;an&nbsp;image&nbsp;tag&nbsp;at&nbsp;the&nbsp;selected&nbsp;location</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;InsertImage(<span class="cs__keyword">string</span>&nbsp;imageLocation);&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;public&nbsp;function&nbsp;to&nbsp;insert&nbsp;a&nbsp;image&nbsp;and&nbsp;prompt&nbsp;user&nbsp;for&nbsp;the&nbsp;link</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;InsertImagePrompt();&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;create&nbsp;a&nbsp;web&nbsp;link&nbsp;from&nbsp;the&nbsp;users&nbsp;selected&nbsp;text</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;InsertLink(<span class="cs__keyword">string</span>&nbsp;href);&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;public&nbsp;function&nbsp;to&nbsp;insert&nbsp;a&nbsp;link&nbsp;and&nbsp;prompt&nbsp;user&nbsp;for&nbsp;the&nbsp;href</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;InsertLinkPrompt();&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;remove&nbsp;a&nbsp;web&nbsp;link&nbsp;from&nbsp;the&nbsp;users&nbsp;selected&nbsp;text</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;RemoveLink();&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;Text&nbsp;Insert&nbsp;Operations</span>&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;insert&nbsp;the&nbsp;given&nbsp;HTML&nbsp;into&nbsp;the&nbsp;selected&nbsp;range</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;InsertHtmlPrompt();&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;insert&nbsp;the&nbsp;given&nbsp;Text&nbsp;into&nbsp;the&nbsp;selected&nbsp;range</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;InsertTextPrompt();&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;returns&nbsp;the&nbsp;acceptable&nbsp;values&nbsp;for&nbsp;the&nbsp;format&nbsp;block</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">string</span>[]&nbsp;GetFormatBlockCommands();&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;formats&nbsp;the&nbsp;selected&nbsp;text&nbsp;wrapping&nbsp;in&nbsp;the&nbsp;given&nbsp;format&nbsp;tag</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;InsertFormatBlock(<span class="cs__keyword">string</span>&nbsp;command);&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;formats&nbsp;the&nbsp;selected&nbsp;text&nbsp;wrapping&nbsp;in&nbsp;a&nbsp;PRE&nbsp;tag</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;InsertFormattedBlock();&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;unformats&nbsp;the&nbsp;selected&nbsp;text&nbsp;removing&nbsp;heading&nbsp;and&nbsp;pre&nbsp;tags</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;InsertNormalBlock();&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;inserts&nbsp;a&nbsp;heading&nbsp;tag&nbsp;values&nbsp;Heading&nbsp;1,2,3,4,5</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;InsertHeading(HtmlHeadingType&nbsp;headingType);&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;System&nbsp;Prompt&nbsp;Dialog&nbsp;Functions</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;allows&nbsp;the&nbsp;insertion&nbsp;of&nbsp;an&nbsp;image&nbsp;using&nbsp;the&nbsp;system&nbsp;dialogs</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;SystemInsertImage();&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;allows&nbsp;the&nbsp;insertion&nbsp;of&nbsp;an&nbsp;href&nbsp;using&nbsp;the&nbsp;system&nbsp;dialogs</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;SystemInsertLink();&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;Font&nbsp;and&nbsp;Color&nbsp;Processing&nbsp;Operations</span>&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;using&nbsp;exec&nbsp;command&nbsp;define&nbsp;font&nbsp;properties&nbsp;for&nbsp;selected&nbsp;tag</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;FormatFontAttributes(HtmlFontProperty&nbsp;font);&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;using&nbsp;exec&nbsp;command&nbsp;define&nbsp;color&nbsp;properties&nbsp;for&nbsp;selected&nbsp;tag</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;FormatFontColor(Color&nbsp;color);&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;display&nbsp;defined&nbsp;font&nbsp;dialog&nbsp;using&nbsp;to&nbsp;set&nbsp;selected&nbsp;text&nbsp;FONT</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;FormatFontAttributesPrompt();&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;display&nbsp;system&nbsp;color&nbsp;dialog&nbsp;and&nbsp;use&nbsp;to&nbsp;set&nbsp;selected&nbsp;text</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;FormatFontColorPrompt();&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;determine&nbsp;the&nbsp;Font&nbsp;of&nbsp;the&nbsp;selected&nbsp;text&nbsp;range</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;set&nbsp;to&nbsp;the&nbsp;default&nbsp;value&nbsp;of&nbsp;not&nbsp;defined</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;HtmlFontProperty&nbsp;GetFontAttributes();&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;determine&nbsp;if&nbsp;the&nbsp;current&nbsp;font&nbsp;selected&nbsp;is&nbsp;bold&nbsp;given&nbsp;a&nbsp;range</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">bool</span>&nbsp;IsFontBold();&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;determine&nbsp;if&nbsp;the&nbsp;current&nbsp;font&nbsp;selected&nbsp;is&nbsp;underline</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">bool</span>&nbsp;IsFontUnderline();&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;determine&nbsp;if&nbsp;the&nbsp;current&nbsp;font&nbsp;selected&nbsp;is&nbsp;italic</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">bool</span>&nbsp;IsFontItalic();&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;determine&nbsp;if&nbsp;the&nbsp;current&nbsp;font&nbsp;selected&nbsp;is&nbsp;strikeout</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">bool</span>&nbsp;IsFontStrikeout();&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;determine&nbsp;if&nbsp;the&nbsp;current&nbsp;font&nbsp;selected&nbsp;is&nbsp;Superscript</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">bool</span>&nbsp;IsFontSuperscript();&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;determine&nbsp;if&nbsp;the&nbsp;current&nbsp;font&nbsp;selected&nbsp;is&nbsp;Subscript</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">bool</span>&nbsp;IsFontSubscript();&nbsp;
&nbsp;
<span class="cs__com">//&nbsp;Find&nbsp;and&nbsp;Replace&nbsp;Operations</span>&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;dialog&nbsp;to&nbsp;allow&nbsp;the&nbsp;user&nbsp;to&nbsp;perform&nbsp;a&nbsp;find&nbsp;and&nbsp;replace</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;FindReplacePrompt();&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;reset&nbsp;the&nbsp;find&nbsp;and&nbsp;replace&nbsp;options&nbsp;to&nbsp;initialize&nbsp;a&nbsp;new&nbsp;search</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;FindReplaceReset();&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;finds&nbsp;the&nbsp;first&nbsp;occurrence&nbsp;of&nbsp;the&nbsp;given&nbsp;text&nbsp;string</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;uses&nbsp;false&nbsp;for&nbsp;the&nbsp;search&nbsp;options</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">bool</span>&nbsp;FindFirst(<span class="cs__keyword">string</span>&nbsp;findText);&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;finds&nbsp;the&nbsp;first&nbsp;occurrence&nbsp;of&nbsp;the&nbsp;given&nbsp;text&nbsp;string</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">bool</span>&nbsp;FindFirst(<span class="cs__keyword">string</span>&nbsp;findText,&nbsp;
<span class="cs__keyword">bool</span>&nbsp;matchWhole,&nbsp;<span class="cs__keyword">bool</span>&nbsp;matchCase);&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;finds&nbsp;the&nbsp;next&nbsp;occurrence&nbsp;of&nbsp;a&nbsp;given&nbsp;text&nbsp;string</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;assumes&nbsp;a&nbsp;previous&nbsp;search&nbsp;was&nbsp;made</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;uses&nbsp;false&nbsp;for&nbsp;the&nbsp;search&nbsp;options</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">bool</span>&nbsp;FindNext(<span class="cs__keyword">string</span>&nbsp;findText);&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;finds&nbsp;the&nbsp;next&nbsp;occurrence&nbsp;of&nbsp;a&nbsp;given&nbsp;text&nbsp;string</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;assumes&nbsp;a&nbsp;previous&nbsp;search&nbsp;was&nbsp;made</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">bool</span>&nbsp;FindNext(<span class="cs__keyword">string</span>&nbsp;findText,&nbsp;
<span class="cs__keyword">bool</span>&nbsp;matchWhole,&nbsp;<span class="cs__keyword">bool</span>&nbsp;matchCase);&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;replace&nbsp;the&nbsp;first&nbsp;occurrence&nbsp;of&nbsp;the&nbsp;given&nbsp;string</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;uses&nbsp;false&nbsp;for&nbsp;the&nbsp;search&nbsp;options</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">bool</span>&nbsp;FindReplaceOne(<span class="cs__keyword">string</span>&nbsp;findText,&nbsp;<span class="cs__keyword">string</span>&nbsp;replaceText);&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;replace&nbsp;the&nbsp;first&nbsp;occurrence&nbsp;of&nbsp;the&nbsp;given&nbsp;string</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">bool</span>&nbsp;FindReplaceOne(<span class="cs__keyword">string</span>&nbsp;findText,&nbsp;<span class="cs__keyword">string</span>&nbsp;replaceText,&nbsp;
<span class="cs__keyword">bool</span>&nbsp;matchWhole,&nbsp;<span class="cs__keyword">bool</span>&nbsp;matchCase);&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;replaces&nbsp;all&nbsp;the&nbsp;occurrences&nbsp;of&nbsp;the&nbsp;given&nbsp;string</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;uses&nbsp;false&nbsp;for&nbsp;the&nbsp;search&nbsp;options</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">int</span>&nbsp;FindReplaceAll(<span class="cs__keyword">string</span>&nbsp;findText,&nbsp;<span class="cs__keyword">string</span>&nbsp;replaceText);&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;replaces&nbsp;all&nbsp;the&nbsp;occurrence&nbsp;of&nbsp;the&nbsp;given&nbsp;string</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">int</span>&nbsp;FindReplaceAll(<span class="cs__keyword">string</span>&nbsp;findText,&nbsp;<span class="cs__keyword">string</span>&nbsp;replaceText,&nbsp;
<span class="cs__keyword">bool</span>&nbsp;matchWhole,&nbsp;<span class="cs__keyword">bool</span>&nbsp;matchCase);&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;Table&nbsp;Processing&nbsp;Operations</span>&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;present&nbsp;to&nbsp;the&nbsp;user&nbsp;the&nbsp;table&nbsp;properties&nbsp;dialog</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;using&nbsp;all&nbsp;the&nbsp;default&nbsp;properties&nbsp;for&nbsp;the&nbsp;table</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;TableInsertPrompt();&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;present&nbsp;to&nbsp;the&nbsp;user&nbsp;the&nbsp;table&nbsp;properties&nbsp;dialog</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;ensure&nbsp;a&nbsp;table&nbsp;is&nbsp;selected&nbsp;or&nbsp;insertion&nbsp;point&nbsp;is&nbsp;in&nbsp;table</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">bool</span>&nbsp;TableModifyPrompt();&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;public&nbsp;function&nbsp;to&nbsp;create&nbsp;a&nbsp;table&nbsp;class</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;insert&nbsp;method&nbsp;then&nbsp;works&nbsp;on&nbsp;this&nbsp;table</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;TableInsert(HtmlTableProperty&nbsp;tableProperties);&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;public&nbsp;function&nbsp;to&nbsp;modify&nbsp;a&nbsp;tables&nbsp;properties</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;ensure&nbsp;a&nbsp;table&nbsp;is&nbsp;selected&nbsp;or&nbsp;insertion&nbsp;point&nbsp;is&nbsp;in&nbsp;table</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">bool</span>&nbsp;TableModify(HtmlTableProperty&nbsp;tableProperties);&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;will&nbsp;insert&nbsp;a&nbsp;new&nbsp;row&nbsp;into&nbsp;the&nbsp;table</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;based&nbsp;on&nbsp;the&nbsp;current&nbsp;user&nbsp;row&nbsp;and&nbsp;insertion&nbsp;after</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;TableInsertRow();&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;will&nbsp;delete&nbsp;the&nbsp;currently&nbsp;selected&nbsp;row</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;based&nbsp;on&nbsp;the&nbsp;current&nbsp;user&nbsp;row&nbsp;location</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;TableDeleteRow();&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;based&nbsp;on&nbsp;then&nbsp;user&nbsp;selection&nbsp;return&nbsp;a&nbsp;table&nbsp;definition</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;if&nbsp;table&nbsp;selected&nbsp;(or&nbsp;insertion&nbsp;point&nbsp;in&nbsp;table)&nbsp;return&nbsp;values</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;GetTableDefinition(<span class="cs__keyword">out</span>&nbsp;HtmlTableProperty&nbsp;table,&nbsp;
<span class="cs__keyword">out</span>&nbsp;<span class="cs__keyword">bool</span>&nbsp;tableFound);&nbsp;
}&nbsp;
&nbsp;
&nbsp;
<span class="cs__com">//&nbsp;enum&nbsp;used&nbsp;to&nbsp;insert&nbsp;a&nbsp;list</span>&nbsp;
<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">enum</span>&nbsp;HtmlListType&nbsp;
{&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;Ordered,&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;Unordered&nbsp;
}&nbsp;
&nbsp;
<span class="cs__com">//&nbsp;enum&nbsp;used&nbsp;to&nbsp;insert&nbsp;a&nbsp;heading</span>&nbsp;
<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">enum</span>&nbsp;HtmlHeadingType&nbsp;
{&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;H1&nbsp;=&nbsp;<span class="cs__number">1</span>,&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;H2&nbsp;=&nbsp;<span class="cs__number">2</span>,&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;H3&nbsp;=&nbsp;<span class="cs__number">3</span>,&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;H4&nbsp;=&nbsp;<span class="cs__number">4</span>,&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;H5&nbsp;=&nbsp;<span class="cs__number">5</span>&nbsp;
}&nbsp;
&nbsp;
<span class="cs__com">//&nbsp;enum&nbsp;used&nbsp;to&nbsp;define&nbsp;the&nbsp;navigate&nbsp;action&nbsp;on&nbsp;a&nbsp;user&nbsp;clicking&nbsp;a&nbsp;href</span>&nbsp;
<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">enum</span>&nbsp;NavigateActionOption&nbsp;
{&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;Default,&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;NewWindow,&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;SameWindow&nbsp;
}&nbsp;
&nbsp;
<span class="cs__com">//&nbsp;enum&nbsp;used&nbsp;to&nbsp;define&nbsp;the&nbsp;image&nbsp;align&nbsp;property</span>&nbsp;
<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">enum</span>&nbsp;ImageAlignOption&nbsp;
{&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;AbsBottom,&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;AbsMiddle,&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;Baseline,&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;Bottom,&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;Left,&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;Middle,&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;Right,&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;TextTop,&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;Top&nbsp;
}&nbsp;
&nbsp;
<span class="cs__com">//&nbsp;enum&nbsp;used&nbsp;to&nbsp;define&nbsp;the&nbsp;horizontal&nbsp;alignment&nbsp;property</span>&nbsp;
<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">enum</span>&nbsp;HorizontalAlignOption&nbsp;
{&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;Default,&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;Left,&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;Center,&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;Right&nbsp;
}&nbsp;
&nbsp;
<span class="cs__com">//&nbsp;enum&nbsp;used&nbsp;to&nbsp;define&nbsp;the&nbsp;vertical&nbsp;alignment&nbsp;property</span>&nbsp;
<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">enum</span>&nbsp;VerticalAlignOption&nbsp;
{&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;Default,&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;Top,&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;Bottom&nbsp;
}&nbsp;
&nbsp;
<span class="cs__com">//&nbsp;enum&nbsp;used&nbsp;to&nbsp;define&nbsp;the&nbsp;visibility&nbsp;of&nbsp;the&nbsp;scroll&nbsp;bars</span>&nbsp;
<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">enum</span>&nbsp;DisplayScrollBarOption&nbsp;
{&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;Yes,&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;No,&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;Auto&nbsp;
}&nbsp;
&nbsp;
<span class="cs__com">//&nbsp;enum&nbsp;used&nbsp;to&nbsp;define&nbsp;the&nbsp;unit&nbsp;of&nbsp;measure&nbsp;for&nbsp;a&nbsp;value</span>&nbsp;
<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">enum</span>&nbsp;MeasurementOption&nbsp;
{&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;Pixel,&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;Percent&nbsp;
}&nbsp;
&nbsp;
&nbsp;
<span class="cs__com">//&nbsp;enum&nbsp;used&nbsp;to&nbsp;modify&nbsp;the&nbsp;font&nbsp;size</span>&nbsp;
<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">enum</span>&nbsp;HtmlFontSize&nbsp;
{&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;Default&nbsp;&nbsp;&nbsp;&nbsp;=&nbsp;<span class="cs__number">0</span>,&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;xxSmall&nbsp;&nbsp;&nbsp;&nbsp;=&nbsp;<span class="cs__number">1</span>,&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;8&nbsp;points</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;xSmall&nbsp;&nbsp;&nbsp;&nbsp;=&nbsp;<span class="cs__number">2</span>,&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;10&nbsp;points</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;Small&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=&nbsp;<span class="cs__number">3</span>,&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;12&nbsp;points</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;Medium&nbsp;&nbsp;&nbsp;&nbsp;=&nbsp;<span class="cs__number">4</span>,&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;14&nbsp;points</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;Large&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=&nbsp;<span class="cs__number">5</span>,&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;18&nbsp;points</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;xLarge&nbsp;&nbsp;&nbsp;&nbsp;=&nbsp;<span class="cs__number">6</span>,&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;24&nbsp;points</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;xxLarge&nbsp;&nbsp;&nbsp;&nbsp;=&nbsp;<span class="cs__number">7</span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;36&nbsp;points</span>&nbsp;
}&nbsp;
&nbsp;
&nbsp;
<span class="cs__com">//&nbsp;struct&nbsp;used&nbsp;for&nbsp;defining&nbsp;FONT&nbsp;attributes&nbsp;(not&nbsp;styles)</span>&nbsp;
[Serializable]&nbsp;
[TypeConverter(<span class="cs__keyword">typeof</span>(HtmlFontPropertyConverter))]&nbsp;
<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">struct</span>&nbsp;HtmlFontProperty&nbsp;
{&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;properties&nbsp;defined&nbsp;for&nbsp;the&nbsp;Font</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">string</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Name;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;HtmlFontSize&nbsp;&nbsp;&nbsp;&nbsp;Size;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">bool</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bold;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">bool</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Italic;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">bool</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Underline;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">bool</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Strikeout;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">bool</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Subscript;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">bool</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Superscript;&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;constrctor&nbsp;for&nbsp;name&nbsp;only</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;HtmlFontProperty(<span class="cs__keyword">string</span>&nbsp;name);&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;constrctor&nbsp;for&nbsp;name&nbsp;and&nbsp;size&nbsp;only</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;HtmlFontProperty(<span class="cs__keyword">string</span>&nbsp;name,&nbsp;HtmlFontSize&nbsp;size);&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;constrctor&nbsp;for&nbsp;all&nbsp;standard&nbsp;attributes</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;HtmlFontProperty(<span class="cs__keyword">string</span>&nbsp;name,&nbsp;HtmlFontSize&nbsp;size,&nbsp;
<span class="cs__keyword">bool</span>&nbsp;bold,&nbsp;<span class="cs__keyword">bool</span>&nbsp;italic,&nbsp;<span class="cs__keyword">bool</span>&nbsp;underline);&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;constrctor&nbsp;for&nbsp;all&nbsp;attributes</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;HtmlFontProperty(<span class="cs__keyword">string</span>&nbsp;name,&nbsp;HtmlFontSize&nbsp;size,&nbsp;
<span class="cs__keyword">bool</span>&nbsp;bold,&nbsp;<span class="cs__keyword">bool</span>&nbsp;italic,&nbsp;<span class="cs__keyword">bool</span>&nbsp;underline,&nbsp;
<span class="cs__keyword">bool</span>&nbsp;strikeout,&nbsp;<span class="cs__keyword">bool</span>&nbsp;subscript,&nbsp;<span class="cs__keyword">bool</span>&nbsp;superscript);&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;constructor&nbsp;given&nbsp;a&nbsp;system&nbsp;Font</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;HtmlFontProperty(System.Drawing.Font&nbsp;font);&nbsp;
&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;public&nbsp;method&nbsp;to&nbsp;convert&nbsp;the&nbsp;html&nbsp;into&nbsp;a&nbsp;readable&nbsp;format</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">override</span>&nbsp;<span class="cs__keyword">string</span>&nbsp;ToString();&nbsp;
&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;equals&nbsp;operator&nbsp;for&nbsp;struct&nbsp;comparsion</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">override</span>&nbsp;<span class="cs__keyword">bool</span>&nbsp;Equals(<span class="cs__keyword">object</span>&nbsp;fontObject);&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;operator&nbsp;to&nbsp;compare&nbsp;two&nbsp;font&nbsp;attributes&nbsp;for&nbsp;equality</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">static</span>&nbsp;<span class="cs__keyword">bool</span>&nbsp;<span class="cs__keyword">operator</span>&nbsp;==(HtmlFontProperty&nbsp;font1,&nbsp;
HtmlFontProperty&nbsp;font2);&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;operator&nbsp;to&nbsp;compare&nbsp;two&nbsp;font&nbsp;attributes&nbsp;for&nbsp;inequality</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">static</span>&nbsp;<span class="cs__keyword">bool</span>&nbsp;<span class="cs__keyword">operator</span>&nbsp;!=(HtmlFontProperty&nbsp;font1,&nbsp;
HtmlFontProperty&nbsp;font2);&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;based&nbsp;on&nbsp;a&nbsp;font&nbsp;name&nbsp;being&nbsp;null&nbsp;the&nbsp;font&nbsp;can&nbsp;be&nbsp;assumed&nbsp;Null</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;default&nbsp;constructor&nbsp;will&nbsp;give&nbsp;a&nbsp;null&nbsp;object</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">bool</span>&nbsp;IsNull;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">bool</span>&nbsp;IsNotNull;&nbsp;
&nbsp;
}&nbsp;
&nbsp;
&nbsp;
<span class="cs__com">//&nbsp;Utility&nbsp;Class&nbsp;to&nbsp;perform&nbsp;Font&nbsp;Attribute&nbsp;conversions</span>&nbsp;
<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">class</span>&nbsp;HtmlFontConversion&nbsp;
{&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;return&nbsp;the&nbsp;correct&nbsp;string&nbsp;name&nbsp;from&nbsp;a&nbsp;HtmlFontSize</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">static</span>&nbsp;<span class="cs__keyword">string</span>&nbsp;HtmlFontSizeString(HtmlFontSize&nbsp;fontSize)&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;return&nbsp;the&nbsp;correct&nbsp;bold&nbsp;description&nbsp;for&nbsp;the&nbsp;bold&nbsp;attribute</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">static</span>&nbsp;<span class="cs__keyword">string</span>&nbsp;HtmlFontBoldString(<span class="cs__keyword">bool</span>&nbsp;fontBold);&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;return&nbsp;the&nbsp;correct&nbsp;bold&nbsp;description&nbsp;for&nbsp;the&nbsp;bold&nbsp;attribute</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">static</span>&nbsp;<span class="cs__keyword">string</span>&nbsp;HtmlFontItalicString(<span class="cs__keyword">bool</span>&nbsp;fontItalic);&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;determine&nbsp;the&nbsp;font&nbsp;size&nbsp;given&nbsp;a&nbsp;selected&nbsp;font&nbsp;in&nbsp;points</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">static</span>&nbsp;HtmlFontSize&nbsp;FontSizeToHtml(<span class="cs__keyword">float</span>&nbsp;fontSize);&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;determine&nbsp;the&nbsp;font&nbsp;size&nbsp;given&nbsp;the&nbsp;html&nbsp;font&nbsp;size</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">static</span>&nbsp;<span class="cs__keyword">float</span>&nbsp;FontSizeFromHtml(HtmlFontSize&nbsp;fontSize);&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;determine&nbsp;the&nbsp;font&nbsp;size&nbsp;given&nbsp;the&nbsp;html&nbsp;int&nbsp;size</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">static</span>&nbsp;<span class="cs__keyword">float</span>&nbsp;FontSizeFromHtml(<span class="cs__keyword">int</span>&nbsp;fontSize);&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;Used&nbsp;to&nbsp;determine&nbsp;the&nbsp;HtmlFontSize&nbsp;from&nbsp;a&nbsp;style&nbsp;attribute</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">static</span>&nbsp;HtmlFontSize&nbsp;StyleSizeToHtml(<span class="cs__keyword">string</span>&nbsp;sizeDesc);&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;Used&nbsp;to&nbsp;determine&nbsp;the&nbsp;the&nbsp;style&nbsp;attribute&nbsp;is&nbsp;for&nbsp;Bold</span>&nbsp;
<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">static</span>&nbsp;<span class="cs__keyword">bool</span>&nbsp;IsStyleBold(<span class="cs__keyword">string</span>&nbsp;style);&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;Used&nbsp;to&nbsp;determine&nbsp;the&nbsp;the&nbsp;style&nbsp;attribute&nbsp;is&nbsp;for&nbsp;Italic</span>&nbsp;
<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">static</span>&nbsp;<span class="cs__keyword">bool</span>&nbsp;IsStyleItalic(<span class="cs__keyword">string</span>&nbsp;style);&nbsp;
&nbsp;
}&nbsp;
&nbsp;
<span class="cs__com">//&nbsp;expandable&nbsp;object&nbsp;converter&nbsp;for&nbsp;the&nbsp;HtmlFontProperty</span>&nbsp;
<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">class</span>&nbsp;HtmlFontPropertyConverter:&nbsp;ExpandableObjectConverter;&nbsp;
&nbsp;
&nbsp;
<span class="cs__com">//&nbsp;struct&nbsp;used&nbsp;for&nbsp;defining&nbsp;TABLE&nbsp;attributes</span>&nbsp;
<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">struct</span>&nbsp;HtmlTableProperty&nbsp;
{&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;properties&nbsp;defined&nbsp;for&nbsp;the&nbsp;table</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">string</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CaptionText;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;HorizontalAlignOption&nbsp;&nbsp;&nbsp;&nbsp;CaptionAlignment;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;VerticalAlignOption&nbsp;&nbsp;&nbsp;&nbsp;CaptionLocation;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">byte</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;BorderSize;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;HorizontalAlignOption&nbsp;&nbsp;&nbsp;&nbsp;TableAlignment;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">byte</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;TableRows;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">byte</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;TableColumns;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">ushort</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;TableWidth;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;MeasurementOption&nbsp;&nbsp;&nbsp;&nbsp;TableWidthMeasurement;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">byte</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CellPadding;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">byte</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CellSpacing;&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;constructor&nbsp;defining&nbsp;a&nbsp;base&nbsp;table&nbsp;with&nbsp;default&nbsp;attributes</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;HtmlTableProperty(<span class="cs__keyword">bool</span>&nbsp;htmlDefaults);&nbsp;
&nbsp;
}&nbsp;
&nbsp;
&nbsp;
<span class="cs__com">//&nbsp;Define&nbsp;delegate&nbsp;for&nbsp;raising&nbsp;an&nbsp;editor&nbsp;exception</span>&nbsp;
<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">delegate</span>&nbsp;<span class="cs__keyword">void</span>&nbsp;HtmlExceptionEventHandler&nbsp;
(<span class="cs__keyword">object</span>&nbsp;sender,&nbsp;HtmlExceptionEventArgs&nbsp;e);&nbsp;
&nbsp;
&nbsp;
<span class="cs__com">//Exception&nbsp;class&nbsp;for&nbsp;HtmlEditor</span>&nbsp;
<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">class</span>&nbsp;HtmlEditorException&nbsp;:&nbsp;ApplicationException&nbsp;
{&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;property&nbsp;for&nbsp;the&nbsp;operation&nbsp;name</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">string</span>&nbsp;Operation;&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;Default&nbsp;constructor</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;HtmlEditorException&nbsp;()&nbsp;:&nbsp;<span class="cs__keyword">base</span>();&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;Constructor&nbsp;accepting&nbsp;a&nbsp;single&nbsp;string&nbsp;message</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;HtmlEditorException&nbsp;(<span class="cs__keyword">string</span>&nbsp;message)&nbsp;
:&nbsp;<span class="cs__keyword">base</span>(message);&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;Constructor&nbsp;accepting&nbsp;a&nbsp;string&nbsp;message</span>&nbsp;
<span class="cs__com">//&nbsp;and&nbsp;an&nbsp;inner&nbsp;exception</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;HtmlEditorException(<span class="cs__keyword">string</span>&nbsp;message,&nbsp;Exception&nbsp;inner)&nbsp;
:&nbsp;<span class="cs__keyword">base</span>(message,&nbsp;inner);&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;Constructor&nbsp;accepting&nbsp;a&nbsp;single&nbsp;string&nbsp;message</span>&nbsp;
<span class="cs__com">//&nbsp;and&nbsp;an&nbsp;operation&nbsp;name</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;HtmlEditorException(<span class="cs__keyword">string</span>&nbsp;message,&nbsp;<span class="cs__keyword">string</span>&nbsp;operation)&nbsp;
:&nbsp;<span class="cs__keyword">base</span>(message);&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;Constructor&nbsp;accepting&nbsp;a&nbsp;string&nbsp;message</span>&nbsp;
<span class="cs__com">//&nbsp;an&nbsp;operation&nbsp;and&nbsp;an&nbsp;inner&nbsp;exception</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;HtmlEditorException(<span class="cs__keyword">string</span>&nbsp;message,&nbsp;<span class="cs__keyword">string</span>&nbsp;operation,&nbsp;
Exception&nbsp;inner)&nbsp;
:&nbsp;<span class="cs__keyword">base</span>(message,&nbsp;inner);&nbsp;
&nbsp;
}&nbsp;
&nbsp;
&nbsp;
<span class="cs__com">//&nbsp;if&nbsp;capturing&nbsp;an&nbsp;exception&nbsp;internally&nbsp;throw&nbsp;an&nbsp;event</span>&nbsp;
<span class="cs__com">//&nbsp;with&nbsp;the&nbsp;following&nbsp;EventArgs</span>&nbsp;
<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">class</span>&nbsp;HtmlExceptionEventArgs&nbsp;:&nbsp;EventArgs&nbsp;
{&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;constructor&nbsp;for&nbsp;event&nbsp;args</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;HtmlExceptionEventArgs&nbsp;
(<span class="cs__keyword">string</span>&nbsp;operation,&nbsp;Exception&nbsp;exception)&nbsp;:&nbsp;<span class="cs__keyword">base</span>();&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;define&nbsp;operation&nbsp;name&nbsp;property&nbsp;get</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;<span class="cs__keyword">string</span>&nbsp;Operation;&nbsp;
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__com">//&nbsp;define&nbsp;message&nbsp;exception&nbsp;get</span>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cs__keyword">public</span>&nbsp;Exception&nbsp;ExceptionObject;&nbsp;
}&nbsp;
</pre>
</div>
</div>
</div>
<div class="endscriptcode">&nbsp;</div>
