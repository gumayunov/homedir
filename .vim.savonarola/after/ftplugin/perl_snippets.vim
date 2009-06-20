if !exists('loaded_snippet') || &cp
    finish
endif

let st = g:snip_start_tag
let et = g:snip_end_tag
let cd = g:snip_elem_delim

" exec "Snippet sub sub ".st."FunctionName".et." {<CR>".st.et."<CR>}<CR>".st.et
exec "Snippet sub sub ".st."MethodName".et."<CR>{<CR>my ( $self".st.et." ) = @_;<CR>".st.et."<CR>}<CR>".st.et
"exec "Snippet package package ".st.et.";<CR>use strict;<CR><CR>sub new<CR>{<CR>my \$class = shift;<CR>\$class = ref \$class if ref \$class;<CR>".st.et."<CR>my \$self = {};<CR>bless \$self, \$class;<CR>\$self;<CR>} <BS><CR> <BS><CR>1;<CR>"
exec "Snippet p package ".st.et.";<CR>use strict;<CR><CR>sub new<CR>{<CR>my \$class = shift;<CR>\$class = ref \$class if ref \$class;<CR>".st.et."<CR>my \$self = {};<CR>bless \$self, \$class;<CR>\$self;<CR>} <BS><CR> <BS><CR>1;"
exec "Snippet xfore ".st."expression".et." foreach @".st."array".et.";".st.et
exec "Snippet xwhile ".st."expression".et." while ".st."condition".et.";".st.et
exec "Snippet xunless ".st."expression".et." unless ".st."condition".et.";".st.et
exec "Snippet slurp my $".st."var".et.";<CR><CR>{ local $/ = undef; local *FILE; open FILE, \"<".st."file".et.">\"; $".st."var".et." = <FILE>; close FILE }".st.et
exec "Snippet if if (".st.et.") {<CR>".st.et."<CR>}<CR>".st.et
exec "Snippet unless unless (".st.et.") {<CR>".st.et."<CR>}<CR>".st.et
exec "Snippet ifee if (".st.et.") {<CR>".st.et."<CR><BS>} elsif (".st.et.") {<CR>".st.et."<CR><BS>} else {<CR>".st.et."<CR>}<CR><CR>".st.et
exec "Snippet ife if (".st.et.") {<CR>".st.et."<CR>} else {<CR>".st.et."<CR>}<CR>".st.et
exec "Snippet for for (my \$".st."var".et." = 0; \$".st."var".et." < ".st."expression".et."; \$".st."var".et."++) {<CR>".st.et."<CR>}<CR>".st.et
exec "Snippet fore foreach my \$".st."var".et." (@".st."array".et.") {<CR>".st.et."<CR>}<CR>".st.et
exec "Snippet eval eval {<CR>".st.et."<CR>};<CR>if ($@) {<CR>".st.et."<CR>}<CR>".st.et
exec "Snippet while while (".st.et.") {<CR>".st.et."<CR>}<CR>".st.et
exec "Snippet xif ".st."expression".et." if ".st."condition".et.";".st.et
exec "Snippet acc sub ".st."field".et."{ @_ > 1 ? \$_[0]->{".st."field".et."} = \$_[1] : \$_[0]->{".st."field".et."} }<CR>".st.et
