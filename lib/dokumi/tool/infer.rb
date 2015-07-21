module Dokumi
  module Tool
    class Infer
      INFER_REPORT_FILE = "infer-out/report.json"

      class << self
        def parse_report(target_project)
          report_path = Support.make_pathname(INFER_REPORT_FILE)

          File.open(report_path) do |file|
            report = JSON.load(file)
            report.map do |info|
              {
                description: info["qualifier"],
                file_path: info["file"],
                line: info["line"].to_i,
              }
            end
          end
        end
      end
    end
  end
end
