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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function MMM_save_dqtMapF(motorModel)

pathname = motorModel.data.pathname;
motName  = motorModel.data.motorName;
resFolder = checkPathSyntax([motName '_results\MMM results\' 'dqtMapF Model - ' int2str(motorModel.data.tempPM) 'deg\']);

if ~exist([pathname resFolder],'dir')
    mkdir([pathname resFolder])
end


Id      = motorModel.FluxMapInv_dq.Id;
Iq      = motorModel.FluxMapInv_dq.Iq;
Fd      = motorModel.FluxMapInv_dq.Fd;
Fq      = motorModel.FluxMapInv_dq.Fq;
T       = motorModel.FluxMapInv_dq.T;
dqtMapF = motorModel.FluxMapInv_dqt;

save([pathname resFolder 'idiq_fdfq_n256_dqt.mat'],'Id','Iq','Fd','Fq','T','dqtMapF')


