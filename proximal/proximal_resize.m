function R = proximal_resize(I, p, q)
    % =========================================================================
    % Se scaleaza imaginea folosind algoritmul de Interpolare Proximala.
    % Transforma imaginea I din dimensiune m x n �n dimensiune p x q.
    % =========================================================================
    [m n nr_colors] = size(I);

    % Se converteste imaginea de intrare la alb-negru, daca este cazul.
    if nr_colors > 1
        R = -1;
        return
    endif

    % TODO: Initializeaza matricea finala drept o matrice nula.
    R = zeros(p, q);
    % Obs:
    % Atunci c�nd se aplica o scalare, punctul (0, 0) al imaginii nu se va deplasa.
    % �n Octave, pixelii imaginilor sunt indexati de la 1 la n.
    % Daca se lucreaza cu indici de la 1 la n si se �nmultesc x si y cu s_x respectiv s_y,
    % atunci originea imaginii se va deplasa de la (1, 1) la (sx, sy)!
    % De aceea, trebuie lucrat cu indici �n intervalul [0, n - 1].

    % TODO: Calculeaza factorii de scalare.
    % Obs: Daca se lucreaza cu indici din intervalul [0, n - 1], ultimul pixel
    % al imaginii se va deplasa de la (m - 1, n - 1) la (p, q).
    % s_x nu va fi q ./ n
    sx = (q - 1) / (n - 1);
    sy = (p - 1) / (m - 1);    
    % TODO: Defineste matricea de transformare pentru redimensionare.
    T = [sx 0; 0 sy];
    % TODO: Inverseaza matricea de transformare, FARA a folosi functii predefinite!
    T_inv = [1/sx 0; 0 1/sy];
    % Se parcurge fiecare pixel din imagine.
    for y = 0 : p - 1
        for x = 0 : q - 1
            % TODO: Aplica transformarea inversa asupra (x, y) si calculeaza x_p si y_p
            % din spatiul imaginii initiale.
            v = T_inv * [x y]';

            % TODO: Trece (xp, yp) din sistemul de coordonate [0, n - 1] in
            % sistemul de coordonate [1, n] pentru a aplica interpolarea.
            v = v + [1;1];

            % TODO: Calculeaza cel mai apropiat pixel.
            x_p = round(v(1));
            y_p = round(v(2));
            
            % TODO: Calculeaza valoarea pixelului din imaginea finala.
            R(y+1, x+1) = I(y_p, x_p);
        endfor
    endfor

    % TODO: Transforma matricea rezultata �n uint8 pentru a fi o imagine valida.
    R = uint8(R);
endfunction
