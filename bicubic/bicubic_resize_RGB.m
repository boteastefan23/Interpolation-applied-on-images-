function out = bicubic_resize_RGB(img, p, q)
    % =========================================================================
    % Redimensioneaza imaginea img astfel încât aceasta save fie de dimensiune p x q.
    % Imaginea img este colorata.
    % =========================================================================

    % TODO: Extrage canalul rosu al imaginii.
    r = img(:, :, 1);

    % TODO: Extrage canalul verde al imaginii.
    g = img(:, :, 2);
    % TODO: Extrage canalul albastru al imaginii.
    b = img(:, :, 3);
    % TODO: Aplica functia bicubic pe cele 3 canale ale imaginii.
    r = bicubic_resize(r, p, q);
    g = bicubic_resize(g, p, q);
    b = bicubic_resize(b, p, q);    
    % TODO: Formeaza imaginea finala concatenand cele 3 canale de culori.
    out = cat(3, r, g, b);
endfunction
