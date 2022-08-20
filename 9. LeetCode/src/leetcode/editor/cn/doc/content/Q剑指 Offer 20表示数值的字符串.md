<p>请实现一个函数用来判断字符串是否表示<strong>数值</strong>（包括整数和小数）。</p>

<p><strong>数值</strong>（按顺序）可以分成以下几个部分：</p>

<ol>
	<li>若干空格</li>
	<li>一个 <strong>小数</strong> 或者 <strong>整数</strong></li>
	<li>（可选）一个 <code>'e'</code> 或 <code>'E'</code> ，后面跟着一个 <strong>整数</strong></li>
	<li>若干空格</li>
</ol>

<p><strong>小数</strong>（按顺序）可以分成以下几个部分：</p>

<ol>
	<li>（可选）一个符号字符（<code>'+'</code> 或 <code>'-'</code>）</li>
	<li>下述格式之一：
	<ol>
		<li>至少一位数字，后面跟着一个点 <code>'.'</code></li>
		<li>至少一位数字，后面跟着一个点 <code>'.'</code> ，后面再跟着至少一位数字</li>
		<li>一个点 <code>'.'</code> ，后面跟着至少一位数字</li>
	</ol>
	</li>
</ol>

<p><strong>整数</strong>（按顺序）可以分成以下几个部分：</p>

<ol>
	<li>（可选）一个符号字符（<code>'+'</code> 或 <code>'-'</code>）</li>
	<li>至少一位数字</li>
</ol>

<p>部分<strong>数值</strong>列举如下：</p>

<ul>
	<li><code>["+100", "5e2", "-123", "3.1416", "-1E-16", "0123"]</code></li>
</ul>

<p>部分<strong>非数值</strong>列举如下：</p>

<ul>
	<li><code>["12e", "1a3.14", "1.2.3", "+-5", "12e+5.4"]</code></li>
</ul>

<p> </p>

<p><strong>示例 1：</strong></p>

<pre>
<strong>输入：</strong>s = "0"
<strong>输出：</strong>true
</pre>

<p><strong>示例 2：</strong></p>

<pre>
<strong>输入：</strong>s = "e"
<strong>输出：</strong>false
</pre>

<p><strong>示例 3：</strong></p>

<pre>
<strong>输入：</strong>s = "."
<strong>输出：</strong>false</pre>

<p><strong>示例 4：</strong></p>

<pre>
<strong>输入：</strong>s = "    .1  "
<strong>输出：</strong>true
</pre>

<p> </p>

<p><strong>提示：</strong></p>

<ul>
	<li><code>1 <= s.length <= 20</code></li>
	<li><code>s</code> 仅含英文字母（大写和小写），数字（<code>0-9</code>），加号 <code>'+'</code> ，减号 <code>'-'</code> ，空格 <code>' '</code> 或者点 <code>'.'</code> 。</li>
</ul>
<div><div>Related Topics</div><div><li>字符串</li></div></div><br><div><li>👍 372</li><li>👎 0</li></div>