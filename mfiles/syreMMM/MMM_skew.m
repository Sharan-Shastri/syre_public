% Copyright 2020
%
%    Licensed under the Apache License, Version 2.0 (the "License");
%    you may not use this file except in compliance with the License.
%    You may obtain a copy of the License at
%
%        http://www.apache.org/licenses/LICENSE-2.0
%
%    Unless required by applicable law or agreed to in writing, software
%    distributed under the License is distributed on an "AS IS" BASIS,
%    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%    See the License for the specific language governing permissions and
%    limitations under the License.

function [motorModel] = MMM_skew(motorModel,skewData,hEdit)

motorModel.AOA         = [];
motorModel.Inductance  = [];
motorModel.idiq        = [];
motorModel.dqtMapF     = [];

motorModel.skew        = skewData;

% dqtMap   = motorModel.dqtMap;

% Skew with dq rules for flux maps and iron loss
[fdfq,ironLoss] = skew_dq(motorModel);

% If dqtMap model is available, skew with dqt rules for flux maps and
% dqtMap
if ~isempty(motorModel.dqtMap)
    [dqtMap,fdfq] = skew_dqt(hEdit,motorModel);
else
    dqtMap = [];
end

motorModel.fdfq      = fdfq;
motorModel.dqtMap    = dqtMap;
motorModel.ironLoss  = ironLoss;
motorModel.skew      = skewData;





