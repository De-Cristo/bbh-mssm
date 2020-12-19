from CRABClient.UserUtilities import config
config = config()

config.General.requestName     = 'bbh_mg_mXHMASSX_GENSIM'
config.General.workArea        = 'bbh_mg_mXHMASSX_GENSIM'
config.General.transferOutputs = True
config.General.transferLogs    = True
#config.JobType.numCores = 4
config.JobType.pluginName = 'PrivateMC'
config.JobType.psetName   = 'gensim_mg_mXHMASSX.py'

config.JobType.allowUndistributedCMSSW = True
config.Data.outputPrimaryDataset = 'bbh_mg_mXHMASSX_GENSIM'
config.Data.inputDBS             = 'global'
config.Data.splitting            = 'EventBased'
config.Data.unitsPerJob          = 500
config.Data.totalUnits           = 100000
config.Data.outLFNDirBase        = '/store/user/dwinterb/bbh_mg_mXHMASSX_GENSIM/'
config.Data.publication          = True
config.Data.outputDatasetTag     = 'bbh_mg_mXHMASSX_GENSIM'
config.JobType.inputFiles = ['bbh_mg_mXHMASSX.tar.gz']


config.Site.storageSite = 'T2_UK_London_IC'
