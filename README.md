<h2 dir="auto"><a id="user-content-installation" class="anchor" aria-hidden="true" href="#installation"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>Video of the script:</h2>

<li>click - https://streamable.com/msejyp</li>
<li>If you have any further questions, you can add me to Discord. [Found in my github profile]</li>

<h2 dir="auto"><a id="user-content-installation" class="anchor" aria-hidden="true" href="#installation"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>Installation</h2>

<ul dir="auto">
<li>Download the script and put it in the <code>[resource]</code> folder.</li>
  <li>Download nh-context and put it in the <code>[resource]</code> or <code>[standalone]</code> folder. (it doesn't really matter)</li>
<li>Add the following code to your server.cfg/resouces.cfg</li>
</ul>

<pre><code>ensure nh-context
ensure nc-rental
</code></pre>

<h2 dir="auto"><a id="user-content-dependencies" class="anchor" aria-hidden="true" href="#dependencies"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>Dependencies</h2>

<ul dir="auto">
<li><a href="https://github.com/nighmares/nh-context">nh-context</a> - to open the car rental menu</li>
</ul>

<h2 dir="auto"><a id="user-content-screenshots" class="anchor" aria-hidden="true" href="#screenshots"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>Use via Eye Target</h2>

<pre><code>AddBoxZone("NewRentalMenu4", vector3(-1230.054, -176.4136, 39.327087), 2, 3.2, {
        name="NewRentalMenu4",
        heading=0,
        debugPoly=false,
        minZ=38.301415,
        maxZ=40.301415
        }, {
            options = {
                {
                    event = "nc-rental:vehiclelist",
                    icon = "fas fa-circle",
                    label = "Rent vehicle",
                },
                {
                    event = "nc-rental:returnvehicle",
                    icon = "fas fa-circle",
                    label = "Return Vehicle (Receive Back 50% of original price)",
                },
            },
            job = {"all"},
            distance = 3.5
    })
</code></pre>

<h2 dir="auto"><a id="user-content-screenshots" class="anchor" aria-hidden="true" href="#screenshots"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>Adding the RentalPapers to qb-inventory</h2>

Go to qb-inventory -> html -> js -> app.js and between lines 500-600 and add the following code
<pre>        } <span class="pl-k">else</span> <span class="pl-k">if</span> (itemData.<span class="pl-smi">name</span> <span class="pl-k">==</span> <span class="pl-s"><span class="pl-pds">"</span>stickynote<span class="pl-pds">"</span></span>) {
            $(<span class="pl-s"><span class="pl-pds">"</span>.item-info-title<span class="pl-pds">"</span></span>).<span class="pl-c1">html</span>(<span class="pl-s"><span class="pl-pds">'</span>&lt;p&gt;<span class="pl-pds">'</span></span> <span class="pl-k">+</span> itemData.<span class="pl-smi">label</span> <span class="pl-k">+</span> <span class="pl-s"><span class="pl-pds">'</span>&lt;/p&gt;<span class="pl-pds">'</span></span>)
            $(<span class="pl-s"><span class="pl-pds">"</span>.item-info-description<span class="pl-pds">"</span></span>).<span class="pl-c1">html</span>(<span class="pl-s"><span class="pl-pds">'</span>&lt;p&gt;<span class="pl-pds">'</span></span> <span class="pl-k">+</span> itemData.<span class="pl-smi">info</span>.<span class="pl-smi">label</span> <span class="pl-k">+</span> <span class="pl-s"><span class="pl-pds">'</span>&lt;/p&gt;<span class="pl-pds">'</span></span>);
        } <span class="pl-k">else</span> <span class="pl-k">if</span> (itemData.<span class="pl-smi">name</span> <span class="pl-k">==</span> <span class="pl-s"><span class="pl-pds">"</span>rentalpapers<span class="pl-pds">"</span></span>) {
            $(<span class="pl-s"><span class="pl-pds">"</span>.item-info-title<span class="pl-pds">"</span></span>).<span class="pl-c1">html</span>(<span class="pl-s"><span class="pl-pds">'</span>&lt;p&gt;<span class="pl-pds">'</span></span> <span class="pl-k">+</span> itemData.<span class="pl-smi">label</span> <span class="pl-k">+</span> <span class="pl-s"><span class="pl-pds">'</span>&lt;/p&gt;<span class="pl-pds">'</span></span>)
            $(<span class="pl-s"><span class="pl-pds">"</span>.item-info-description<span class="pl-pds">"</span></span>).<span class="pl-c1">html</span>(<span class="pl-s"><span class="pl-pds">'</span>&lt;p&gt;&lt;strong&gt;Plate: &lt;/strong&gt;&lt;span&gt;<span class="pl-pds">'</span></span><span class="pl-k">+</span> itemData.<span class="pl-smi">info</span>.<span class="pl-smi">label</span> <span class="pl-k">+</span> <span class="pl-s"></span>'&lt;/span&gt;&lt;/p&gt;'</span>);</pre>
