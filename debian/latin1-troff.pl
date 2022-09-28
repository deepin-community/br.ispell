#!/usr/bin/perl -w -pi

BEGIN {
  $accented_chars = q (ÁÉÍÓÚáéíóúÜüÂÊÔâêôÀÈÌÒÙàèìòùÃÕãõÇç);
  $accents =        q (''''''''''::^^^^^^``````````~~~~,,);
  $chars =          q (AEIOUaeiouUuAEOaeoAEIOUaeiouAOaoCc);
}

for $n (0 .. length ($chars) - 1) {
  $ac = substr ($accented_chars, $n, 1);
  $a =  substr ($accents, $n, 1);
  $c =  substr ($chars, $n, 1);
  s/$ac/\\[$a$c]/g;
}
