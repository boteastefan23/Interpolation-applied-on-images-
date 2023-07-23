function out = proximal_2x2_RGB(img, STEP = 0.1)
    % ==============================================================================================
    % Aplica Interpolare Proximala pe imaginea 2 x 2 definita img cu puncte intermediare echidistante.
    % img este o imagine colorata RGB -Red, Green, Blue.
    % =============================================================================================

    % TODO: Extrage canalul rosu al imaginii.
    f1 = img(:, :, 1);
    % TODO: Extrage canalul verde al imaginii.
    f2 = img(:, :, 2);
    % TODO: Extrage canalul albastru al imaginii.
    f3 = img(:,:, 3);
    % TODO: Aplic? functia proximal pe cele 3 canale ale imaginii.
    R = proximal_2x2(f1, STEP);
    G = proximal_2x2(f2, STEP);
    B = proximal_2x2(f3, STEP);
    % TODO: Formeaza imaginea finala concatenând cele 3 canale de culori.
    out = cat(3, R, G, B);
endfunction
