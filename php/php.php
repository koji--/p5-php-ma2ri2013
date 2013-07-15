<?php

$ch = curl_init("http://search.cpan.org/search?query=PHP&mode=all");
curl_setopt($ch, CURLOPT_HEADER, 0);
curl_exec($ch);
curl_close($ch);
