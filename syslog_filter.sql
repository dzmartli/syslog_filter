-- trigger for filtering syslog messages
-- function black_hole doesn't exist
DROP TRIGGER IF EXISTS `Syslog`.`filter_fan`;
DELIMITER //
	CREATE TRIGGER `Syslog`.`filter_fan`
	BEFORE INSERT
	ON `Syslog`.`SystemEvents`
	FOR EACH ROW
	BEGIN
		IF new.Message LIKE '%FAN_FAILED: Fan 2 not rotating' THEN
			CALL black_hole();
		END IF;
	END//
DELIMITER ;
