if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx OPAM_SWITCH_PREFIX '/Users/Felix/.opam/default';
set -gx CAML_LD_LIBRARY_PATH '/Users/Felix/.opam/default/lib/stublibs:/Users/Felix/.opam/default/lib/ocaml/stublibs:/Users/Felix/.opam/default/lib/ocaml';
set -gx OCAML_TOPLEVEL_PATH '/Users/Felix/.opam/default/lib/toplevel';
set -gx PATH '/Users/Felix/.opam/default/bin' '/usr/local/bin' '/opt/homebrew/bin/' '/usr/bin' '/bin' '/usr/sbin' '/sbin' '/Users/FelixSchlegel/mongodb/bin' '/opt/X11/bin' '/Library/Apple/usr/bin' '/Library/TeX/texbin';
fish_add_path /opt/homebrew/bin/ruby
rvm default
fish_add_path /usr/local/opt/openssl@3/bin
fish_add_path /usr/local/opt/openssl@3/bin
