# Packages
install.packages("formattable")
install.packages("webshot") 

# Libraries
library(formattable)

# Create the table
df <- data.frame(
  c(
    'Death from high-risk prostate cancer versus cardiovascular mortality with hormonal therapy: a decision analysis',
    'Decision analysis of stereotactic radiation surgery versus stereotactic radiation surgery and whole-brain radiation therapy for 1 to 3 brain metastases',
    'When is a biopsy-proven diagnosis necessary before stereotactic ablative radiotherapy for lung cancer?: a decision analysis',
    'Using nonrandomized studies to inform complex clinical decisions: the thorny issue of cranial radiation therapy for t-cell acute lymphoblastic leukemia',
    'Neoadjuvant therapy versus upfront surgical strategies in resectable pancreatic cancer: a markov decision analysis',
    'Simulation-based approximate policy iteration for dynamic patient scheduling for radiation therapy',
    'Reconsidering adjuvant versus salvage radiation therapy for prostate cancer in the genomics era',
    'A radiobiological markov simulation tool for aiding decision making in proton therapy referral',
    'Radiosurgical, neurosurgical, or no intervention for cerebral cavernous malformations: a decision analysis',
    'Nonoperative management versus radical surgery of rectal cancer after neoadjuvant therapy-induced clinical complete response: a markov decision analysis',
    'Development and validation of a decision analytical model for posttreatment surveillance for patients with oropharyngeal carcinoma'
  ),
  c(
    'RT without HT vs. RT and 6 months of HT vs. RT and 3 years of HT',
    'SRS vs. SRS and WBRT',
    'Surveillance vs. PET Scan-Directed SABR vs. PET Scan-Biopsy-SABR',
    'No CRT vs. CRT Only for Leukemic Involvement vs. CRT',
    'Neoadjuvant Therapy vs. Upfront Surgery in Resectable Cancers',
    'Patient Scheduling',
    'Adjuvant Therapy vs. Surveillance',
    'Proton vs. Photon',
    'Neurosurgical vs. Radiosurgical vs. Conservative Management',
    'Non-Surgery Management vs. Surgery',
    'Optimal Surveillance'
  ),
  c(
    'Prostate',
    'Brain',
    'Lung',
    'Brain',
    'Pancreas',
    'N/A',
    'Prostate',
    'Brain',
    'Brain',
    'Rectum',
    'Head and Neck'
  ),
  c(
    'QALE',
    'QALE, QALM',
    'Prior Probability Threshold',
    'LE, QALY',
    'LE, QALE',
    'N/A',
    'QOL, Recurrence, OS, QALY',
    'QALY',
    'QALY, Risk of 5-year Recurrence',
    'LY, QALY',
    'Time to Disease Detection'
  )
)
colnames(df) <- c('Title', 'Comparison', 'Site', 'Measure of Benefit')
f_df <- formattable(df, align='l', table.attr = 'style="font-size: 36px; font-family: Arial";\"')
print(f_df)

# Save the table
library("htmltools")
library("webshot")
webshot::install_phantomjs()

export_formattable <- function(f, file, width="100%", height=NULL, 
                               background="white", delay=0.2)
{
  w <- as.htmlwidget(f, width=width, height=height)
  path <- html_print(w, background=background, viewer=NULL)
  url <- paste0("file:///", gsub("\\\\", "/", normalizePath(path)))
  webshot(url,
          file = file,
          selector = ".formattable_widget",
          delay = delay)
}
export_formattable(f_df,"FT.png")
