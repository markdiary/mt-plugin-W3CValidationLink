package W3CValidationLink::MakeLink;
use strict;

sub _hdlr_validation_link{
    my ($cb, $app, $tmpl) = @_;

    my $old = <<EOC;
        </mt:if>
      </mt:if>
  </mtapp:setting>
    </mt:unless>

  <mt:else eq="text">
EOC

# !!! ↑ DO NOT EDIT THE ORIGINAL TEMPLATE HERE ↑

    $old = quotemeta($old);

    my $new = <<EOC;
        <mt:if name="entry_permalink">
      <a title="Verification of HTML of this entry page" class="button" href="<mt:var name="entry_permalink" />" onclick="(function(u){if(u.indexOf('http://localhost') < 0 ){window.open('http://validator.w3.org/check?uri='+ encodeURIComponent(u));}else{window.open('http://validator.w3.org/#validate_by_input');}})(this.href);return false;">Validate</a>
        </mt:if>
<mt:ignore>
# !!!  DO NOT EDIT THE ORIGINAL TEMPLATE ↓    </mt:ignore>
        </mt:if>
      </mt:if>
  </mtapp:setting>
    </mt:unless>

  <mt:else eq="text">
EOC

    $$tmpl =~ s/$old/$new/;

}

1;