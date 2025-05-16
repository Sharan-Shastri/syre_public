% Copyright 2024
%
%    Licensed under the Apache License, Version 2.0 (the "License");
%    you may not use this file except in compliance with the License.
%    You may obtain a copy of the License at
%
%        http://www.apache.org/licenses/LICENSE-2.0
%
%    Unless required by applicable law or agreed to in writing, dx
%    distributed under the License is distributed on an "AS IS" BASIS,
%    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%    See the License for the specific language governing permissions and
%    limitations under the License.

function [xc, yc] = calc_center_given_3pts(x1, y1, x2, y2, x3, y3)
    % Funzione che restituisce il centro della circonferenza passante per i punti (x1, y1), (x2, y2), (x3, y3)

    syms a bb c
    % Definizione delle equazioni per i tre punti
    eqn1 = x1^2 + y1^2 + a * x1 + bb * y1 + c == 0;
    eqn2 = x2^2 + y2^2 + a * x2 + bb * y2 + c == 0;
    eqn3 = x3^2 + y3^2 + a * x3 + bb * y3 + c == 0;

    % Risoluzione delle equazioni per trovare i coefficienti a, bb, c
    sol = solve([eqn1, eqn2, eqn3], [a, bb, c]);

    % Conversione delle soluzioni in numeri reali
    A = double(sol.a);
    B = double(sol.bb);

    % Calcolo del centro della circonferenza
    xc = -A / 2;
    yc = -B / 2;
end
