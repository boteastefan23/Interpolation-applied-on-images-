function [Ix, Iy, Ixy] = precalc_d(I)
    % =========================================================================
    % Prealculeaza matricile Ix, Iy si Ixy ce contin derivatele dx, dy, dxy ale 
    % imaginii I pentru fiecare pixel al acesteia.
    % =========================================================================
    
    % Obtinem dimensiunea imaginii.
    [m n] = size(I);
    
    % TODO: Tranforma matricea I in double.
    I = double(I);

    Ix = zeros(m, n);
    
    for j = 1 : m
      for i = 1 : n
          Ix(j, i) = fx(I(:,:), i, j);
      endfor
    endfor
    
    % TODO: calculeaza matricea cu derivate fata de y Iy
    Iy = zeros(m, n);
    for j = 1 : m
      for i = 1 : n
          Iy(j, i) = fy(I(:,:), i, j);
      endfor
    endfor
    % TODO: calculeaza matricea cu derivate fata de xy Ixy
   Ixy = zeros(m, n); 
   
    for j = 1 : m
      for i = 1 : n
          Ixy(j, i) = fxy(I(:,:), i, j);
      endfor
    endfor

endfunction
