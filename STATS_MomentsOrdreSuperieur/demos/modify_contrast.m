% Projet Statistiques
%
% Projet :
% Etude des moments d'ordre supérieur, application à la
% description de texture
%
% Auteurs :
% Martin Florian
% Théologien Thibault
%
% But de la fonction :
% Modifier la variance d'une image d'une certaine valeur (Modifie le contraste)

function [texture] = modify_contrast(gray, value)
  mn = mean(mean(gray));
  texture = gray;
  for j = 1:size(texture, 1)
    for i = 1:size(texture, 2)
      if texture(j, i) < mn
        if texture(j, i) > 0 + value
          texture(j, i) = texture(j, i) - value;
        else
          printf('Attention - Contraste : Perte d''informations sur la texture (D-%d)\n', texture(j, i));
          texture(j, i) = 0;
        end
      else
        if texture(j, i) < 255 - value
          texture(j, i) = texture(j, i) + value;
        else
          printf('Attention - Contraste : Perte d''informations sur la texture (U-%d)\n', texture(j, i));
          texture(j, i) = 255;
        end
      end
    end
  end
end