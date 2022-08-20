<p>请实现一个函数用来匹配包含<code>&#39;. &#39;</code>和<code>&#39;*&#39;</code>的正则表达式。模式中的字符<code>&#39;.&#39;</code>表示任意一个字符，而<code>&#39;*&#39;</code>表示它前面的字符可以出现任意次（含0次）。在本题中，匹配是指字符串的所有字符匹配整个模式。例如，字符串<code>&quot;aaa&quot;</code>与模式<code>&quot;a.a&quot;</code>和<code>&quot;ab*ac*a&quot;</code>匹配，但与<code>&quot;aa.a&quot;</code>和<code>&quot;ab*a&quot;</code>均不匹配。</p>

<p><strong>示例 1:</strong></p>

<pre><strong>输入:</strong>
s = &quot;aa&quot;
p = &quot;a&quot;
<strong>输出:</strong> false
<strong>解释:</strong> &quot;a&quot; 无法匹配 &quot;aa&quot; 整个字符串。
</pre>

<p><strong>示例 2:</strong></p>

<pre><strong>输入:</strong>
s = &quot;aa&quot;
p = &quot;a*&quot;
<strong>输出:</strong> true
<strong>解释:</strong>&nbsp;因为 &#39;*&#39; 代表可以匹配零个或多个前面的那一个元素, 在这里前面的元素就是 &#39;a&#39;。因此，字符串 &quot;aa&quot; 可被视为 &#39;a&#39; 重复了一次。
</pre>

<p><strong>示例&nbsp;3:</strong></p>

<pre><strong>输入:</strong>
s = &quot;ab&quot;
p = &quot;.*&quot;
<strong>输出:</strong> true
<strong>解释:</strong>&nbsp;&quot;.*&quot; 表示可匹配零个或多个（&#39;*&#39;）任意字符（&#39;.&#39;）。
</pre>

<p><strong>示例 4:</strong></p>

<pre><strong>输入:</strong>
s = &quot;aab&quot;
p = &quot;c*a*b&quot;
<strong>输出:</strong> true
<strong>解释:</strong>&nbsp;因为 &#39;*&#39; 表示零个或多个，这里 &#39;c&#39; 为 0 个, &#39;a&#39; 被重复一次。因此可以匹配字符串 &quot;aab&quot;。
</pre>

<p><strong>示例 5:</strong></p>

<pre><strong>输入:</strong>
s = &quot;mississippi&quot;
p = &quot;mis*is*p*.&quot;
<strong>输出:</strong> false</pre>

<ul>
	<li><code>s</code>&nbsp;可能为空，且只包含从&nbsp;<code>a-z</code>&nbsp;的小写字母。</li>
	<li><code>p</code>&nbsp;可能为空，且只包含从&nbsp;<code>a-z</code>&nbsp;的小写字母以及字符&nbsp;<code>.</code>&nbsp;和&nbsp;<code>*</code>，无连续的 <code>&#39;*&#39;</code>。</li>
</ul>

<p>注意：本题与主站 10&nbsp;题相同：<a href="https://leetcode-cn.com/problems/regular-expression-matching/">https://leetcode-cn.com/problems/regular-expression-matching/</a></p>
<div><div>Related Topics</div><div><li>递归</li><li>字符串</li><li>动态规划</li></div></div><br><div><li>👍 435</li><li>👎 0</li></div>