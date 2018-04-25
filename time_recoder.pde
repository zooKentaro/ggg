class TimeRecorder {
    public String table[];

    public TimeRecorder() {
        this.table = new String[game.config.MAX_TIME_RECODE_NUM];
    }

    /**
     *　レコードに動作内容と時間をセットする
     */
    public void set(String action, int expire_ms)
    {
        for (int i = 0; i < this.table.length; i++) {
            if (this.table[i] == null) {
                this.table[i] = String.format("%s-%s-%s", action, millis(), expire_ms);
                return;
            }
        }
    }

    /**
     * 動作の残り時間を返す
     */
    public int get(String action) {
        for (int i = 0; i < this.table.length; i++) {
            if (this.table[i] == null) continue;
            String[] row = this.table[i].split("-");

            if (row.length < 2) {
                this.table[i] = null;
                continue;
            }

            String row_action = row[0];
            int row_ms = int(row[1]);
            int row_expire_ms = int(row[2]);

            // 該当する動作内容の期限が過ぎていればレコードを消してtrueを返す
            if (row_action.equals(action)) {
                // 期限内である場合は削除して0
                int remaining_time = row_ms + row_expire_ms - millis();
                if (remaining_time <= 0) {
                    this.table[i] = null;
                    return 0;
                }
                // 残り時間を返す
                return remaining_time;
            }
        }
        return 0;
    }
}
